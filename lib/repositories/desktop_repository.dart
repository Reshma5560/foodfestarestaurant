import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:foodfestarestaurant/controller/account/account_controller.dart';
import 'package:foodfestarestaurant/controller/account/components/edit_account_controller.dart';
import 'package:foodfestarestaurant/controller/home/components/addons/addons_controller.dart';
import 'package:foodfestarestaurant/controller/home/components/food/components/food_details_controller.dart';
import 'package:foodfestarestaurant/controller/home/components/food/food_controller.dart';
import 'package:foodfestarestaurant/controller/home/home_controller.dart';
import 'package:foodfestarestaurant/controller/order_detail_controller.dart';
import 'package:foodfestarestaurant/data/api/api_function.dart';
import 'package:foodfestarestaurant/data/models/complete_order_model.dart';
import 'package:foodfestarestaurant/data/models/current_order_model.dart';
import 'package:foodfestarestaurant/data/models/get_addons_model.dart';
import 'package:foodfestarestaurant/data/models/get_food-model.dart';
import 'package:foodfestarestaurant/data/models/get_food_details_model.dart';
import 'package:foodfestarestaurant/data/models/get_order_by_id_model.dart';
import 'package:foodfestarestaurant/data/models/get_profile_model.dart';
import 'package:foodfestarestaurant/data/models/request_order_model.dart';
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
            con.userApiImageFile.value = con.getDataMap?.data.image ?? "";

            con.userName.value =
                "${con.getDataMap?.data.firstName} ${con.getDataMap?.data.lastName}";
            con.phoneNoName.value = con.getDataMap?.data.phone ?? "";
            con.firstName.value = con.getDataMap?.data.firstName ?? "";
            con.lastName.value = con.getDataMap?.data.lastName ?? "";
            con.email.value = con.getDataMap?.data.email ?? "";
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
            editAccountController.imagePath.value,
            filename: editAccountController.imagePath.value),
      });
      await APIFunction()
          .postApiCall(apiName: ApiUrls.updateUserProfileUrl, params: formData)
          .then(
        (response) async {
          printData(key: "update profile response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              await getProfileApiCall();
              Get.back();
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

  ///get current order list api
  Future<dynamic> getCurrentOrderListAPI({required bool isInitial}) async {
    final HomeController con = Get.find<HomeController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.currentOrderListData.clear();
          con.page.value = 1;
          con.isLoading.value = true;
          con.nextPageStop.value = true;
        }

        if (con.nextPageStop.isTrue) {
          await APIFunction()
              .getApiCall(
                  apiName:
                      "${ApiUrls.restaurantUrl}${ApiUrls.getCurrentOrderUrl}?page=${con.page.value}")
              .then(
            (response) async {
              CurrentOrderModel currentOrderModel =
                  CurrentOrderModel.fromJson(response);

              currentOrderModel.data?.data?.forEach((element) {
                // log("-------------${element.restaurant}");
                // log("-------------${element.restaurant != null}");
                con.currentOrderListData.add(element);
              });

              // con.currentOrderListData.refresh();
              con.page.value++;
              printData(
                  key: "current order length",
                  value: con.currentOrderListData.length);
              if (con.currentOrderListData.length ==
                  currentOrderModel.data?.total) {
                con.nextPageStop.value = false;
              }
              return response;
            },
          );
        }
      }
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      con.isLoading.value = false;
      con.paginationLoading.value = false;
    }
  }

  ///get request order list api
  Future<dynamic> getRequestOrderListAPI({required bool isInitial}) async {
    final HomeController con = Get.find<HomeController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.requestOrderListData.clear();
          con.page.value = 1;
          con.isLoading.value = true;
          con.nextPageStop.value = true;
        }

        if (con.nextPageStop.isTrue) {
          await APIFunction()
              .getApiCall(
                  apiName:
                      "${ApiUrls.restaurantUrl}${ApiUrls.getRequestOrderUrl}?page=${con.page.value}")
              .then(
            (response) async {
              RequestOrderModel requestOrderModel =
                  RequestOrderModel.fromJson(response);

              requestOrderModel.data?.data?.forEach((element) {
                // log("-------------${element.restaurant}");
                // log("-------------${element.restaurant != null}");
                con.requestOrderListData.add(element);
              });

              con.requestOrderListData.refresh();
              con.page.value++;
              printData(
                  key: "request order length",
                  value: con.requestOrderListData.length);
              if (con.requestOrderListData.length ==
                  requestOrderModel.data?.total) {
                con.nextPageStop.value = false;
              }
              return response;
            },
          );
        }
      }
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      con.isLoading.value = false;
      con.paginationLoading.value = false;
    }
  }

  ///get completed order list api
  Future<dynamic> getCompletedOrderListAPI({required bool isInitial}) async {
    final HomeController con = Get.find<HomeController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.completeOrderListData.clear();
          con.page.value = 1;
          con.isLoading.value = true;
          con.nextPageStop.value = true;
        }

        if (con.nextPageStop.isTrue) {
          await APIFunction()
              .getApiCall(
                  apiName:
                      "${ApiUrls.restaurantUrl}${ApiUrls.getCompleteOrderUrl}?page=${con.page.value}")
              .then(
            (response) async {
              CompleteOrderModel pastOrderModel =
                  CompleteOrderModel.fromJson(response);

              pastOrderModel.data?.data?.forEach((element) {
                con.completeOrderListData.add(element);
              });
              con.completeOrderListData.refresh();

              con.page.value++;
              printData(
                  key: "completed order length",
                  value: con.completeOrderListData.length);
              if (con.completeOrderListData.length ==
                  pastOrderModel.data?.total) {
                con.nextPageStop.value = false;
              }
              return response;
            },
          );
        }
      }
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      con.isLoading.value = false;
      con.paginationLoading.value = false;
    }
  }

  //get order by id api call
  Future<dynamic> getOrderByIdApiCall(
      {RxBool? isLoader, required String orderId}) async {
    final con = Get.find<OrderDetailController>();

    try {
      await APIFunction()
          .getApiCall(apiName: "${ApiUrls.getOrderByIdUrl}/$orderId")
          .then(
        (response) async {
          printData(key: "get order detail by id response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetOrderByIdModel data = GetOrderByIdModel.fromJson(response);

            con.getOrderDataModel.value = data;
            log("${con.getOrderDataModel}");
            log("ORDER track data ${con.getOrderDataModel.value.data}");
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

//Accept order api call
  Future<dynamic> acceptOrderApiCall({RxBool? isLoader, dynamic params}) async {
    try {
      isLoader?.value = true;

      await APIFunction()
          .getApiCall(
              apiName: '${ApiUrls.restaurantUrl}${ApiUrls.acceptOrderUrl}',
              queryParameters: params)
          .then(
        (response) async {
          printData(key: "accept order response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              getCurrentOrderListAPI(isInitial: true);
              getRequestOrderListAPI(isInitial: true);
              getCompletedOrderListAPI(isInitial: true);

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

  ///get food list api
  Future<dynamic> getFoodListAPI({required RxBool isLoader}) async {
    final FoodController con = Get.find<FoodController>();
    try {
      if (await getConnectivityResult()) {
        await APIFunction()
            .getApiCall(
                apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getFoodUrl}")
            // "?page=${con.page.value}")
            .then(
          (response) async {
            printData(key: "get food response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetFoodModel getFoodResponse = GetFoodModel.fromJson(response);
              con.getOrderDataModel.value = getFoodResponse;
            }
            return response;
          },
        );
      }
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      isLoader.value = false;
    }
  }

  ///get food details by id api
  Future<dynamic> getFoodDetailsByIdAPI(
      {required RxBool isLoader, required String foodId}) async {
    final FoodDetailsController con = Get.find<FoodDetailsController>();
    try {
      if (await getConnectivityResult()) {
        await APIFunction()
            .getApiCall(
                apiName:
                    "${ApiUrls.restaurantUrl}${ApiUrls.getFoodDetailsUrl}/$foodId")
            // "?page=${con.page.value}")
            .then(
          (response) async {
            printData(key: "get food details response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetFoodDetailsModel getFoodDetailResponse =
                  GetFoodDetailsModel.fromJson(response);
              con.getFoodDetailModel.value = getFoodDetailResponse;
            }
            return response;
          },
        );
      }
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      con.isLoading.value = false;
    }
  }

  ///get addons list api
  Future<dynamic> getAddonsListAPI({required RxBool isLoader}) async {
    final AddonsController con = Get.find<AddonsController>();
    try {
      if (await getConnectivityResult()) {
        await APIFunction()
            .getApiCall(
                apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getAddonsUrl}")
            .then(
          (response) async {
            printData(key: "get addons response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetAddonsModel getFoodResponse =
                  GetAddonsModel.fromJson(response);
              con.getAddonsDataModel.value = getFoodResponse;
            }
            return response;
          },
        );
      }
    } catch (e) {
      printError(type: this, errText: "$e");
    } finally {
      isLoader.value = false;
    }
  }

//add addons api
  Future<dynamic> addAddonsApiCall({RxBool? isLoader, dynamic params}) async {
    var params = {"addon_name": "Extra Cheesessss", "price": "12"};
    try {
      isLoader?.value = true;
      await APIFunction()
          .postApiCall(
              apiName: "${ApiUrls.restaurantUrl}${ApiUrls.addAddonsUrl}",
              params: params)
          .then(
        (response) async {
          printData(key: "add addons response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              Get.offAllNamed(AppRoutes.loginScreen);
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
