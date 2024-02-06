import 'dart:developer';

import 'package:foodfestarestaurant/controller/account/components/display_customer_controller.dart';
import 'package:foodfestarestaurant/controller/account/components/display_deliveryman_controller.dart';
import 'package:foodfestarestaurant/data/api/api_function.dart';
import 'package:foodfestarestaurant/data/handler/api_url.dart';
import 'package:foodfestarestaurant/data/models/get_customer_data_model.dart';
import 'package:foodfestarestaurant/data/models/get_deliveryman_data_model.dart';
import 'package:foodfestarestaurant/res/color_print.dart';
import 'package:foodfestarestaurant/utils/utils.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class AccountRepository {
  //get delivery man list api call
  Future<dynamic> getDeliverymanApiCall({RxBool? isLoader}) async {
    final DisplayDeliveryManController con =
        Get.find<DisplayDeliveryManController>();

    try {
      await APIFunction()
          .getApiCall(
              apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getDeliveryManUrl}")
          .then(
        (response) async {
          printData(key: "get delivery man response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetDeliveryManDataModel data =
                GetDeliveryManDataModel.fromJson(response);

            con.getDeliveryManDataModel.value = data;
            for (var element in con.getDeliveryManDataModel.value.data!) {
              con.getDeliverymanListData.add(element);
            }
          }
          log("${con.getDeliverymanListData}");

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

  //get customer list api call
  Future<dynamic> getCustomerApiCall({RxBool? isLoader}) async {
    final DisplayCustomerController con = Get.find<DisplayCustomerController>();

    try {
      await APIFunction()
          .getApiCall(
              apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getCustomerUrl}")
          .then(
        (response) async {
          printData(key: "get customer response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetCustomerModel data = GetCustomerModel.fromJson(response);

            con.getCustomerDataModel.value = data;
            for (var element in con.getCustomerDataModel.value.data!) {
              con.getCustomerListData.add(element);
            }
          }
          log("${con.getCustomerListData}");

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
}
