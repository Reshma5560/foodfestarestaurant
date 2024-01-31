import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:foodfestarestaurant/controller/account/account_controller.dart';
import 'package:foodfestarestaurant/controller/account/components/edit_account_controller.dart';
import 'package:foodfestarestaurant/data/api/api_function.dart';
import 'package:foodfestarestaurant/data/models/get_profile_model.dart';
import 'package:foodfestarestaurant/res/color_print.dart';
import 'package:foodfestarestaurant/res/ui_utils.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:foodfestarestaurant/utils/utils.dart';
import 'package:get/get.dart';

import '../data/handler/api_url.dart';

class DesktopRepository {
  Future<dynamic> getProfileApiCall({RxBool? isLoader}) async {
    final con = Get.find<ProfileController>();

    try {
      isLoader?.value = true;
      await APIFunction().getApiCall(apiName: ApiUrls.getProfileUrl).then(
        (response) async {
          printData(key: "get profile  response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetProfileModel data = GetProfileModel.fromJson(response);

            con.getDataMap = data;
            log("${con.getDataMap}");
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
      rethrow;
    } finally {
      isLoader?.value = false;
    }
  }

  Future<dynamic> editProfileApiCall({RxBool? isLoader}) async {
    final editAccountController = Get.find<EditAccountController>();
    try {
      isLoader?.value = true;
      dio.FormData formData = dio.FormData.fromMap({
        "first_name": editAccountController.firstNameCon.text.trim(),
        "last_name": editAccountController.lastNameCon.text.trim(),
        "email": editAccountController.emailCon.text.trim(),
        "phone": editAccountController.mobileNumberCon.text.trim(),
        "image": await dio.MultipartFile.fromFile(
            editAccountController.selectedProfileImage!.path,
            filename: editAccountController.name),
      });
      await APIFunction()
          .postApiCall(apiName: ApiUrls.updateUserProfileUrl, params: formData)
          .then(
        (response) async {
          printData(key: "update profile response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              Get.back();
              await getProfileApiCall();
              Get.offNamed(AppRoutes.bottomScreen);
            }
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader?.value = false;
    }
  }
}
