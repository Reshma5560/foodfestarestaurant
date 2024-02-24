// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';
import 'package:foodfestarestaurant/controller/setting/components/business_management_schedule_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/business_mangement_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/display_customer_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/display_deliveryman_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/my-earning_controller.dart';
import 'package:foodfestarestaurant/data/api/api_function.dart';
import 'package:foodfestarestaurant/data/handler/api_url.dart';
import 'package:foodfestarestaurant/data/models/get_business_config_model.dart';
import 'package:foodfestarestaurant/data/models/get_cuisine_model.dart';
import 'package:foodfestarestaurant/data/models/get_customer_data_model.dart';
import 'package:foodfestarestaurant/data/models/get_deliveryman_data_model.dart';
import 'package:foodfestarestaurant/data/models/get_ny_earning_model.dart';
import 'package:foodfestarestaurant/data/models/get_schedule_model.dart';
import 'package:foodfestarestaurant/res/color_print.dart';
import 'package:foodfestarestaurant/res/ui_utils.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:foodfestarestaurant/utils/utils.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class AccountRepository {
  //get delivery man list api call
  Future<dynamic> getDeliverymanApiCall({RxBool? isLoader}) async {
    final DisplayDeliveryManController con =
        Get.find<DisplayDeliveryManController>();

    try {
      con.getDeliverymanListData.clear();
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
      con.getCustomerListData.clear();
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

  //get business configuration api call
  Future<dynamic> getBusinessManagementConfigApiCall(
      {required RxBool isLoader}) async {
    final BusinessManagementController con =
        Get.find<BusinessManagementController>();

    try {
      isLoader.value = true;
      await APIFunction()
          .getApiCall(
              apiName:
                  "${ApiUrls.restaurantUrl}${ApiUrls.getBusinessConfigUrl}")
          .then(
        (response) async {
          printData(key: "get business config response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetBusinessConfigModel getBusinessConfigModel =
                GetBusinessConfigModel.fromJson(response);

            con.getBusinessConfigData.value =
                getBusinessConfigModel.data ?? GetBusinessConfigData();

            con.selectCloseRes.value =
                con.getBusinessConfigData.value.closeTemporarily == 0
                    ? false
                    : true;
            con.selectSchedule.value =
                con.getBusinessConfigData.value.scheduleDelivery == 0
                    ? false
                    : true;
            con.selectHome.value =
                con.getBusinessConfigData.value.homeDelivery == 0
                    ? false
                    : true;

            con.selectTakeaway.value =
                con.getBusinessConfigData.value.takeAway ?? false;
            con.selectVeg.value =
                con.getBusinessConfigData.value.veg == 0 ? false : true;
            con.selectNonVeg.value =
                con.getBusinessConfigData.value.nonVeg == 0 ? false : true;
            con.selectCutlery.value =
                con.getBusinessConfigData.value.cutlery ?? false;

            con.minimunQtyAmountCon.value.text =
                con.getBusinessConfigData.value.minimumOrderAmount ?? "";
            con.gstCon.value.text = con.getBusinessConfigData.value.gst ?? "";
            con.tagCon.value.text = con.getBusinessConfigData.value.tags ?? "";
            // con.selectedChoice
            //     .add(con.getBusinessConfigData.value.cuisineRestaurant);
            for (var element
                in con.getBusinessConfigData.value.cuisineRestaurant!) {
              con.selectedChoice.add(element.cuisineId ?? "");
            }
            // for (var i = 0;
            //     i < con.getBusinessConfigData.value.cuisineRestaurant!.length;
            //     i++) {
            //   if (con.getCuisineListData[i] == con.getCuisineListData[i].id) {
            //     con.cuisineCon.value.text =
            //         con.getCuisineListData[i].cuisineName ?? "";
            //   }
            // }
            con.metatTitleCon.value.text =
                con.getBusinessConfigData.value.metaTitle ?? "";
            con.metaDescCon.value.text =
                con.getBusinessConfigData.value.metaDescription ?? "";
            con.image.value = con.getBusinessConfigData.value.metaImage ?? "";

            await getCuisineApiCall(isLoader: isLoader);
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
      isLoader.value = false;
    }
  }

  //add business management schedule api
  Future<dynamic> addScheduleApiCall({RxBool? isLoader}) async {
    final BusinessManagementScheduleController con =
        Get.find<BusinessManagementScheduleController>();
    try {
      isLoader?.value = true;
      var params = {
        "saturday_opening": con.selectedSaturdayOpening.value == "closed"
            ? 0
            : con.selectedSaturdayOpening.value,
        "saturday_closing": con.selectedSaturdayClosing.value == "closed"
            ? 0
            : con.selectedSaturdayClosing.value,
        "sunday_closing": con.selectedSundayClosing.value == "closed"
            ? 0
            : con.selectedSundayClosing.value,
        "sunday_opening": con.selectedSundayOpening.value == "closed"
            ? 0
            : con.selectedSundayOpening.value,
        "monday_closing": con.selectedMondayClosing.value == "closed"
            ? 0
            : con.selectedMondayClosing.value,
        "monday_opening": con.selectedMondayOpening.value == "closed"
            ? 0
            : con.selectedMondayOpening.value,
        "tuesday_closing": con.selectedTuesdayClosing.value == "closed"
            ? 0
            : con.selectedTuesdayClosing.value,
        "tuesday_opening": con.selectedTuesdayOpening.value == "closed"
            ? 0
            : con.selectedTuesdayOpening.value,
        "wednesday_closing": con.selectedWendesdayClosing.value == "closed"
            ? 0
            : con.selectedWendesdayClosing.value,
        "wednesday_opening": con.selectedWendesdayOpening.value == "closed"
            ? 0
            : con.selectedWendesdayOpening.value,
        "thursday_closing": con.selectedThursdayClosing.value == "closed"
            ? 0
            : con.selectedThursdayClosing.value,
        "thursday_opening": con.selectedThursdayOpening.value == "closed"
            ? 0
            : con.selectedThursdayOpening.value,
        "friday_closing": con.selectedFridayClosing.value == "closed"
            ? 0
            : con.selectedFridayClosing.value,
        "friday_opening": con.selectedFridayOpening.value == "closed"
            ? 0
            : con.selectedFridayOpening.value,
      };
      await APIFunction()
          .postApiCall(
              apiName: "${ApiUrls.restaurantUrl}${ApiUrls.addScheduleUrl}",
              params: params)
          .then(
        (response) async {
          printData(
              key: "add schedule configuration response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              Get.offAllNamed(AppRoutes.bottomScreen);
              // Get.back();
              // getAddonsListAPI(
              //     isLoader: isLoader ?? true.obs, isInitial: false);
            }
          }
          return response;
        },
      );
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
        toast(e.message);
      } else {
        toast(e.message);
      }
    } finally {
      isLoader?.value = false;
    }
  }

//add restaurant detail setting api call
  Future<dynamic> addRestaurantDetailSettingApiCall(
      {required RxBool isLoader}) async {
    final BusinessManagementController con =
        Get.find<BusinessManagementController>();

    try {
      isLoader.value = true;
      dio.FormData formData = dio.FormData.fromMap({
        "close_temporarily": con.selectCloseRes.isTrue ? 1 : 0,
        "schedule_delivery": con.selectSchedule.isTrue ? 1 : 0,
        "home_delivery": con.selectHome.isTrue ? 1 : 0,
        "take_away": con.selectTakeaway.isTrue ? 1 : 0,
        "veg": con.selectVeg.isTrue ? 1 : 0,
        "non_veg": con.selectNonVeg.isTrue ? 1 : 0,
        "cutlery": con.selectCutlery.isTrue ? 1 : 0,
        "minimum_order_amount": con.minimunQtyAmountCon.value.text.trim(),
        "gst": con.gstCon.value.text.trim(),
        "cuisine_id": con.selectedChoice,
        "tags": con.tagCon.value.text.trim(),
        "meta_title": con.metatTitleCon.value.text.trim(),
        "meta_description": con.metaDescCon.value.text.trim(),
        "meta_image": con.image.isNotEmpty
            ? await dio.MultipartFile.fromFile(con.image.value,
                filename: con.image.value.split("/").last)
            : con.apiImage != null
                ? await dio.MultipartFile.fromFile(con.apiImage!.path,
                    filename: con.imagePath.value.split("/").last)
                : ""
      });

      await APIFunction()
          .postApiCall(
              apiName: "${ApiUrls.restaurantUrl}${ApiUrls.addConfigUrl}",
              params: formData)
          .then(
        (response) async {
          printData(
              key: "add restaurant configuration response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              await addScheduleApiCall(isLoader: isLoader);
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
      isLoader.value = false;
    }
  }

  //get cuisine list api call
  Future<dynamic> getCuisineApiCall({RxBool? isLoader}) async {
    final BusinessManagementController con =
        Get.find<BusinessManagementController>();

    try {
      await APIFunction().getApiCall(apiName: ApiUrls.getCuisineUrl).then(
        (response) async {
          printData(key: "get cuisine response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetCuisineModel getCuisineData = GetCuisineModel.fromJson(response);

            if (getCuisineData.data != null) {
              // con.getCuisineListData.value = data;
              for (var element in getCuisineData.data!) {
                con.getCuisineListData.add(element);
              }
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
      rethrow;
    } finally {
      isLoader?.value = false;
    }
  }

  //get business schedule configuration api call
  Future<dynamic> getBusinessManagementScheduleConfigApiCall(
      {required RxBool isLoader}) async {
    final BusinessManagementScheduleController con =
        Get.find<BusinessManagementScheduleController>();

    try {
      isLoader.value = true;
      await APIFunction()
          .getApiCall(
              apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getScheduleUrl}")
          .then((response) async {
        printData(
            key: "get business schedule config response", value: response);
        if (!isValEmpty(response) && response["status"] == true) {
          GetScheduleModel getScheduleModel =
              GetScheduleModel.fromJson(response);

          con.getScheduleData.value =
              getScheduleModel.data ?? GetScheduleData();

          for (var i = 0; i < con.items.length; i++) {
            if (con.getScheduleData.value.restaurantSchedule?.saturdayClosing ==
                con.items[i]['value']) {
              con.selectedSaturdayClosing.value = con.getScheduleData.value
                          .restaurantSchedule?.saturdayClosing ==
                      "0"
                  ? "closed"
                  : con.items[i]['value'] ?? "";
            }
            if (con.getScheduleData.value.restaurantSchedule?.saturdayOpening ==
                con.items[i]['value']) {
              con.selectedSaturdayOpening.value = con.getScheduleData.value
                          .restaurantSchedule?.saturdayOpening ==
                      "0"
                  ? "closed"
                  : con.items[i]['value'] ?? "";
            }

            if (con.getScheduleData.value.restaurantSchedule?.sundayClosing ==
                con.items[i]['value']) {
              con.selectedSundayClosing.value =
                  con.getScheduleData.value.restaurantSchedule?.sundayClosing ==
                          "0"
                      ? "closed"
                      : con.items[i]['value'] ?? "";
            }
            if (con.getScheduleData.value.restaurantSchedule?.sundayOpening ==
                con.items[i]['value']) {
              con.selectedSundayOpening.value =
                  con.getScheduleData.value.restaurantSchedule?.sundayOpening ==
                          "0"
                      ? "closed"
                      : con.items[i]['value'] ?? "";
            }

            if (con.getScheduleData.value.restaurantSchedule?.mondayClosing ==
                con.items[i]['value']) {
              con.selectedMondayClosing.value =
                  con.getScheduleData.value.restaurantSchedule?.mondayClosing ==
                          "0"
                      ? "closed"
                      : con.items[i]['value'] ?? "";
            }
            if (con.getScheduleData.value.restaurantSchedule?.mondayOpening ==
                con.items[i]['value']) {
              con.selectedMondayOpening.value =
                  con.getScheduleData.value.restaurantSchedule?.mondayOpening ==
                          "0"
                      ? "closed"
                      : con.items[i]['value'] ?? "";
            }

            if (con.getScheduleData.value.restaurantSchedule?.tuesdayClosing ==
                con.items[i]['value']) {
              con.selectedTuesdayClosing.value = con.getScheduleData.value
                          .restaurantSchedule?.thursdayClosing ==
                      "0"
                  ? "closed"
                  : con.items[i]['value'] ?? "";
            }
            if (con.getScheduleData.value.restaurantSchedule?.thursdayOpening ==
                con.items[i]['value']) {
              con.selectedTuesdayOpening.value = con.getScheduleData.value
                          .restaurantSchedule?.tuesdayOpening ==
                      "0"
                  ? "closed"
                  : con.items[i]['value'] ?? "";
            }

            if (con.getScheduleData.value.restaurantSchedule
                    ?.wednesdayClosing ==
                con.items[i]['value']) {
              con.selectedWendesdayClosing.value = con.getScheduleData.value
                          .restaurantSchedule?.wednesdayClosing ==
                      "0"
                  ? "closed"
                  : con.items[i]['value'] ?? "";
            }
            if (con.getScheduleData.value.restaurantSchedule
                    ?.wednesdayOpening ==
                con.items[i]['value']) {
              con.selectedWendesdayOpening.value = con.getScheduleData.value
                          .restaurantSchedule?.wednesdayOpening ==
                      "0"
                  ? "closed"
                  : con.items[i]['value'] ?? "";
            }

            if (con.getScheduleData.value.restaurantSchedule?.thursdayClosing ==
                con.items[i]['value']) {
              con.selectedThursdayClosing.value = con.getScheduleData.value
                          .restaurantSchedule?.thursdayClosing ==
                      "0"
                  ? "closed"
                  : con.items[i]['value'] ?? "";
            }
            if (con.getScheduleData.value.restaurantSchedule?.thursdayOpening ==
                con.items[i]['value']) {
              con.selectedThursdayOpening.value = con.getScheduleData.value
                          .restaurantSchedule?.thursdayOpening ==
                      "0"
                  ? "closed"
                  : con.items[i]['value'] ?? "";
            }

            if (con.getScheduleData.value.restaurantSchedule?.fridayClosing ==
                con.items[i]['value']) {
              con.selectedFridayClosing.value =
                  con.getScheduleData.value.restaurantSchedule?.fridayClosing ==
                          "0"
                      ? "closed"
                      : con.items[i]['value'] ?? "";
            }
            if (con.getScheduleData.value.restaurantSchedule?.fridayOpening ==
                con.items[i]['value']) {
              con.selectedFridayOpening.value =
                  con.getScheduleData.value.restaurantSchedule?.fridayOpening ==
                          "0"
                      ? "closed"
                      : con.items[i]['value'] ?? "";
            }
          }
          return response;
        }
      });
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
      rethrow;
    } finally {
      isLoader.value = false;
    }
  }

  Future<dynamic> getEarningApiCall({RxBool? isLoader}) async {
    final con = Get.find<MyEarningController>();

    try {
      isLoader?.value = true;
      await APIFunction()
          .getApiCall(
              apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getMyearningUrl}")
          .then(
        (response) async {
          printData(key: "get earning  response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetMyEarningModel data = GetMyEarningModel.fromJson(response);

            con.myEarningData.value = data;
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
}
