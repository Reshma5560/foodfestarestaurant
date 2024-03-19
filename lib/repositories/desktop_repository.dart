// ignore_for_file: unnecessary_null_comparison, unrelated_type_equality_checks

import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:foodfestarestaurant/controller/home/home_controller.dart';
import 'package:foodfestarestaurant/controller/order_management_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/addons/addons_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/edit_account_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/food/components/add_food_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/food/components/food_details_controller.dart';
import 'package:foodfestarestaurant/controller/setting/components/food/food_controller.dart';
import 'package:foodfestarestaurant/data/api/api_function.dart';
import 'package:foodfestarestaurant/data/models/complete_order_model.dart';
import 'package:foodfestarestaurant/data/models/cureent_order_status_model.dart';
import 'package:foodfestarestaurant/data/models/current_order_model.dart';
import 'package:foodfestarestaurant/data/models/get_addons_model.dart';
import 'package:foodfestarestaurant/data/models/get_category_model.dart';
import 'package:foodfestarestaurant/data/models/get_food-model.dart';
import 'package:foodfestarestaurant/data/models/get_food_details_model.dart';
import 'package:foodfestarestaurant/data/models/get_order_by_id_model.dart';
import 'package:foodfestarestaurant/data/models/get_order_history_filter_model.dart';
import 'package:foodfestarestaurant/data/models/get_profile_model.dart';
import 'package:foodfestarestaurant/data/models/get_restaurant_addons_model.dart';
import 'package:foodfestarestaurant/data/models/get_sub_category_model.dart';
import 'package:foodfestarestaurant/data/models/request_order_model.dart';
import 'package:foodfestarestaurant/res/color_print.dart';
import 'package:foodfestarestaurant/res/ui_utils.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:foodfestarestaurant/utils/local_storage.dart';
import 'package:foodfestarestaurant/utils/utils.dart';
import 'package:get/get.dart';

import '../data/handler/api_url.dart';

class DesktopRepository {
  Future<dynamic> getProfileApiCall({RxBool? isLoader}) async {
    final con = Get.find<EditAccountController>();

    try {
      isLoader?.value = true;
      await APIFunction().getApiCall(apiName: ApiUrls.getProfileUrl).then(
        (response) async {
          printData(key: "get profile  response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetProfileModel data = GetProfileModel.fromJson(response);

            con.getDataMap = data;
            con.image.value = con.getDataMap?.data.image ?? "";
            con.firstNameCon.text = con.getDataMap?.data.firstName ?? "";
            con.lastNameCon.text = con.getDataMap?.data.lastName ?? "";
            con.emailCon.text = con.getDataMap?.data.email ?? LocalStorage.email.value;
            con.mobileNumberCon.text = con.getDataMap?.data.phone ?? "";
            LocalStorage.prefs.write(Prefs.firstName, con.firstNameCon.value.text.trim());
            LocalStorage.prefs.write(Prefs.lastName, con.lastNameCon.value.text.trim());
            LocalStorage.prefs.write(Prefs.userImage, con.image.value);

            LocalStorage.firstName.value = LocalStorage.prefs.read(Prefs.firstName) ?? "";
            LocalStorage.lastName.value = LocalStorage.prefs.read(Prefs.lastName) ?? "";
            LocalStorage.userImage.value = LocalStorage.prefs.read(Prefs.userImage) ?? "";
            await LocalStorage.readDataInfo();
            printYellow("-------------  ${LocalStorage.firstName.value}");
            printYellow("-------------  ${LocalStorage.lastName.value}");
            printYellow("-------------  ${LocalStorage.userImage.value}");
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

  Future<dynamic> editProfileApiCall({RxBool? isLoader, dynamic data}) async {
    try {
      isLoader?.value = true;
      dio.FormData formData = dio.FormData.fromMap(data);
      await APIFunction().postApiCall(apiName: ApiUrls.updateUserProfileUrl, params: formData).then(
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
          await APIFunction().getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getCurrentOrderUrl}", queryParameters: {
            "per_page": 20,
            "page": con.page.value,
          }).then(
            (response) async {
              printData(key: "current order response", value: response);
              CurrentOrderModel currentOrderModel = CurrentOrderModel.fromJson(response);

              con.currentOrderListData.value = currentOrderModel.data?.data ?? [];

              con.page.value++;
              printData(key: "current order length", value: con.currentOrderListData.length);
              if (con.currentOrderListData.length == currentOrderModel.data?.total) {
                con.nextPageStop.value = false;
              }
              await getCurrentOrderStatusListApiCall(isLoader: con.isLoading);
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

  // ///get current order list api
  // Future<dynamic> getCurrentOrderListAPI({required bool isInitial}) async {
  //   final HomeController con = Get.find<HomeController>();
  //   try {
  //     if (await getConnectivityResult()) {
  //       con.currentOrderListData.clear();
  //       if (isInitial) {
  //         con.page.value = 1;
  //         con.isLoading.value = true;
  //         con.nextPageStop.value = true;
  //       }

  //       if (con.nextPageStop.isTrue) {
  //         await APIFunction()
  //             .getApiCall(
  //                 apiName:
  //                     "${ApiUrls.restaurantUrl}${ApiUrls.getCurrentOrderUrl}?per_page=${con.page.value}")
  //             .then(
  //           (response) async {
  //             CurrentOrderModel currentOrderModel =
  //                 CurrentOrderModel.fromJson(response);

  //             currentOrderModel.data?.data?.forEach((element) {
  //               // log("-------------${element.restaurant}");
  //               // log("-------------${element.restaurant != null}");
  //               con.currentOrderListData.add(element);
  //             });

  //             // con.currentOrderListData.refresh();
  //             con.page.value++;
  //             printData(
  //                 key: "current order length",
  //                 value: con.currentOrderListData.length);
  //             if (con.currentOrderListData.length ==
  //                 currentOrderModel.data?.total) {
  //               con.nextPageStop.value = false;
  //             }
  //             await getCurrentOrderStatusListApiCall(isLoader: con.isLoading);
  //             return response;
  //           },
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     printError(type: this, errText: "$e");
  //   } finally {
  //     con.isLoading.value = false;
  //     con.paginationLoading.value = false;
  //   }
  // }

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
          await APIFunction().getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getRequestOrderUrl}", queryParameters: {
            "per_page": 20,
            "page": con.page.value,
          }).then(
            (response) async {
              printData(key: "request order response", value: response);
              RequestOrderModel requestOrderModel = RequestOrderModel.fromJson(response);

              con.requestOrderListData.value += requestOrderModel.data?.data ?? [];
              con.page.value++;
              printData(key: "request order length", value: con.requestOrderListData.length);
              if (con.requestOrderListData.length == requestOrderModel.data?.total) {
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

  // ///get request order list api
  // Future<dynamic> getRequestOrderListAPI({required bool isInitial}) async {
  //   final HomeController con = Get.find<HomeController>();
  //   try {
  //     if (await getConnectivityResult()) {
  //       con.requestOrderListData.clear();
  //       if (isInitial) {
  //         con.page.value = 1;
  //         con.isLoading.value = true;
  //         con.nextPageStop.value = true;
  //       }

  //       if (con.nextPageStop.isTrue) {
  //         await APIFunction()
  //             .getApiCall(
  //                 apiName:
  //                     "${ApiUrls.restaurantUrl}${ApiUrls.getRequestOrderUrl}?per_page=${con.page.value}")
  //             .then(
  //           (response) async {
  //             RequestOrderModel requestOrderModel =
  //                 RequestOrderModel.fromJson(response);

  //             requestOrderModel.data?.data?.forEach((element) {
  //               con.requestOrderListData.add(element);
  //             });
  //             con.requestOrderListData.refresh();

  //             con.page.value++;
  //             printData(
  //                 key: "request order length",
  //                 value: con.requestOrderListData.length);
  //             if (con.requestOrderListData.length ==
  //                 requestOrderModel.data?.total) {
  //               con.nextPageStop.value = false;
  //             }

  //             return response;
  //           },
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     printError(type: this, errText: "$e");
  //   } finally {
  //     con.isLoading.value = false;
  //     con.paginationLoading.value = false;
  //   }
  // }

  // ///get completed order list api
  // Future<dynamic> getCompletedOrderListAPI({required bool isInitial}) async {
  //   final HomeController con = Get.find<HomeController>();
  //   try {
  //     if (await getConnectivityResult()) {
  //       con.completeOrderListData.clear();
  //       if (isInitial) {
  //         con.page.value = 1;
  //         con.isLoading.value = true;
  //         con.nextPageStop.value = true;
  //       }

  //       if (con.nextPageStop.isTrue) {
  //         await APIFunction()
  //             .getApiCall(
  //                 apiName:
  //                     "${ApiUrls.restaurantUrl}${ApiUrls.getCompleteOrderUrl}?page=${con.page.value}")
  //             .then(
  //           (response) async {
  //             CompleteOrderModel pastOrderModel =
  //                 CompleteOrderModel.fromJson(response);

  //             pastOrderModel.data?.data?.forEach((element) {
  //               con.completeOrderListData.add(element);
  //             });
  //             con.completeOrderListData.refresh();

  //             con.page.value++;
  //             printData(
  //                 key: "completed order length",
  //                 value: con.completeOrderListData.length);
  //             if (con.completeOrderListData.length ==
  //                 pastOrderModel.data?.total) {
  //               con.nextPageStop.value = false;
  //             }
  //             return response;
  //           },
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     printError(type: this, errText: "$e");
  //   } finally {
  //     con.isLoading.value = false;
  //     con.paginationLoading.value = false;
  //   }
  // }

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
          await APIFunction().getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getCompleteOrderUrl}", queryParameters: {
            "per_page": 20,
            "page": con.page.value,
          }).then(
            (response) async {
              printData(key: "complete order response", value: response);
              CompleteOrderModel completeOrderModel = CompleteOrderModel.fromJson(response);

              con.completeOrderListData.value += completeOrderModel.data?.data ?? [];
              con.page.value++;
              printData(key: "complete order length", value: con.completeOrderListData.length);
              if (con.completeOrderListData.length == completeOrderModel.data?.total) {
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
  Future<dynamic> getOrderByIdApiCall({RxBool? isLoader, required String orderId, required Rx<GetOrderByIdModel> orderData}) async {
    // final con = Get.find<OrderDetailController>();

    try {
      await APIFunction().getApiCall(apiName: "${ApiUrls.getOrderByIdUrl}/$orderId").then(
        (response) async {
          printData(key: "order track response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            GetOrderByIdModel data = GetOrderByIdModel.fromJson(response);

            orderData.value = data;
            log("$data");
            log("ORDER track data ${orderData.value.data}");
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

      await APIFunction().getApiCall(apiName: '${ApiUrls.restaurantUrl}${ApiUrls.acceptOrderUrl}', queryParameters: params).then(
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
  Future<dynamic> getFoodListAPI({required RxBool isLoader, required bool isInitial}) async {
    final FoodController con = Get.find<FoodController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.getOrderDataList.clear();
          con.page.value = 10;
          con.isLoading.value = true;
          con.nextPageStop.value = true;
        }
        if (con.nextPageStop.isTrue) {
          await APIFunction()
              .getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getFoodUrl}?per_page=${con.page.value}")
              // "?page=${con.page.value}")
              .then((response) async {
            con.getOrderDataList.clear();
            printData(key: "get food response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetFoodModel getFoodResponse = GetFoodModel.fromJson(response);
              con.getOrderDataModel.value = getFoodResponse;

              getFoodResponse.data?.data?.forEach((element) {
                con.getOrderDataList.add(element);
              });
              con.getOrderDataList.refresh();

              con.page.value++;
              printData(key: "food length", value: con.getOrderDataList.length);
              if (con.getOrderDataList.length == getFoodResponse.data?.total) {
                con.nextPageStop.value = false;
              }
            }
            return response;
          });
        }
      }
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
        toast(e.message);
      } else {
        toast(e.message);
      }
    } finally {
      isLoader.value = false;
    }
  }

  ///get food details by id api
  Future<dynamic> getFoodDetailsByIdFoodScreenAPI({required RxBool isLoader, required String foodId}) async {
    final FoodDetailsController con = Get.find<FoodDetailsController>();
    try {
      isLoader.value = true;
      if (await getConnectivityResult()) {
        await APIFunction()
            .getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getFoodDetailsUrl}/$foodId")
            // "?page=${con.page.value}")
            .then(
          (response) async {
            printData(key: "get food details response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetFoodDetailsModel getFoodDetailResponse = GetFoodDetailsModel.fromJson(response);

              con.getFoodDetailModel.value = getFoodDetailResponse;
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
  Future<dynamic> getFoodDetailsByIdAPI({required RxBool isLoader, required String foodId}) async {
    final AddFoodController con = Get.find<AddFoodController>();
    try {
      isLoader.value = true;
      if (await getConnectivityResult()) {
        await APIFunction()
            .getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getFoodDetailsUrl}/$foodId")
            // "?page=${con.page.value}")
            .then(
          (response) async {
            printData(key: "get food details response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetFoodDetailsModel getFoodDetailResponse = GetFoodDetailsModel.fromJson(response);

              con.foodNameCon.value.text = getFoodDetailResponse.data?.foodName ?? "";
              con.shortDesCon.value.text = getFoodDetailResponse.data?.description ?? "";
              con.image.value = getFoodDetailResponse.data?.image ?? "";

              printYellow("veg  ------------ ${getFoodDetailResponse.data!.veg}");
              for (var element in con.itemTypeData) {
                if (element.id == getFoodDetailResponse.data?.veg) {
                  con.selectItemTypeDropDownValue.value = element;

                  printYellow("selectItemTypeDropDownValue  ------------ ${con.selectItemTypeDropDownValue.value.name}");
                }
              }
              for (var element in con.getCategoryList) {
                if (element.id == getFoodDetailResponse.data?.categoryId) {
                  con.selectCategoryDropDownValue.value = element;

                  printYellow("selectCategoryDropDownValue  ------------ ${con.selectCategoryDropDownValue.value.categoryName}");
                }
              }
              if (getFoodDetailResponse.data?.categoryIds != null) {
                DesktopRepository()
                    .getSubCategoryListAPI(isLoader: con.isLoading, categoryId: getFoodDetailResponse.data?.categoryId ?? "")
                    .then((value) {
                  if (con.getSubCategoryList.isNotEmpty) {
                    for (var element in con.getSubCategoryList) {
                      if (element.id == getFoodDetailResponse.data?.categoryId) {
                        con.selectSubCategoryDropDownValue.value = element;

                        printYellow("selectSubCategoryDropDownValue  ------------ ${con.selectSubCategoryDropDownValue.value.categoryName}");
                      }
                    }
                  }
                });
              }

              con.minimumQtyCon.value.text = getFoodDetailResponse.data?.minimumCartQuantity.toString() ?? "";
              con.totalQtyCon.value.text = getFoodDetailResponse.data?.maximumCartQuantity.toString() ?? "";
              con.priceCon.value.text = getFoodDetailResponse.data?.basePrice ?? "";
              con.discountCon.value.text = getFoodDetailResponse.data?.discount.toString() ?? "";

              if (getFoodDetailResponse.data?.discountType != null) {
                for (var element in con.discountTypeData) {
                  if (element.name == getFoodDetailResponse.data?.discountType) {
                    con.selectDiscountTypeDropDownValue.value = element;

                    printYellow("selectDiscountTypeDropDownValue  ------------ ${con.selectDiscountTypeDropDownValue.value.name}");
                  }
                }
              }
              con.disPriceCon.value.text = getFoodDetailResponse.data?.price.toString() ?? "";
              con.tagCon.value.text = getFoodDetailResponse.data?.tag ?? "";

              con.startTimeCon.value.text = getFoodDetailResponse.data?.availableTimeStarts ?? "";
              con.endTimeCon.value.text = getFoodDetailResponse.data?.availableTimeEnds ?? "";
              // con.getFoodDetailModel.value = getFoodDetailResponse;
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
  Future<dynamic> getAddonsListAPI({required RxBool isLoader, required bool isInitial}) async {
    final AddonsController con = Get.find<AddonsController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.getAddonsDataList.clear();
          con.page.value = 10;
          con.isLoading.value = true;
          con.nextPageStop.value = true;
        }
        if (con.nextPageStop.isTrue) {
          await APIFunction()
              .getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getAddonsUrl}?per_page=${con.page.value}")
              .then((response) async {
            printData(key: "get addons response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetAddonsModel getAddonResponse = GetAddonsModel.fromJson(response);
              // con.getAddonsDataModel.value = getFoodResponse;
              // con.nameCon.value.clear();
              // con.priceCon.value.clear();

              getAddonResponse.data!.data?.forEach((element) {
                con.getAddonsDataList.add(element);
              });
              con.getAddonsDataList.refresh();

              con.page.value++;
              printData(key: "addon length", value: con.getAddonsDataList.length);
              if (con.getAddonsDataList.length == getAddonResponse.data?.total) {
                con.nextPageStop.value = false;
              }
            }
            return response;
          });
        }
      }
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
        toast(e.message);
      } else {
        toast(e.message);
      }
    } finally {
      isLoader.value = false;
    }
  }

//add addons api
  Future<dynamic> addAddonsApiCall({RxBool? isLoader, dynamic params}) async {
    final AddonsController con = Get.find<AddonsController>();
    con.getAddonsDataList.clear();
    try {
      isLoader?.value = true;

      await APIFunction().postApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.addAddonsUrl}", params: params).then(
        (response) async {
          printData(key: "add addons response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              // Get.offAllNamed(AppRoutes.loginScreen);
              Get.back();
              // isLoader?.value = false;
              await getAddonsListAPI(isLoader: con.isLoading, isInitial: true);
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

//update addons api
  Future<dynamic> updateAddonsApiCall(String addonId, {RxBool? isLoader, dynamic params}) async {
    final AddonsController con = Get.find<AddonsController>();
    con.getAddonsDataList.clear();
    try {
      isLoader?.value = true;
      await APIFunction().postApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.updateAddonUrl}/$addonId", params: params).then(
        (response) async {
          printData(key: "update addons response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              // Get.offAllNamed(AppRoutes.loginScreen);
              Get.back();

              await getAddonsListAPI(isLoader: con.isLoading, isInitial: true);
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

  //update addons status api
  Future<dynamic> updateAddonsStatusApiCall(String addonStatus, {required RxBool isLoader, dynamic params}) async {
    final AddonsController con = Get.find<AddonsController>();
    con.getAddonsDataList.clear();
    try {
      isLoader.value = true;
      await APIFunction().postApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.updateAddonStatusUrl}/$addonStatus", params: params).then(
        (response) async {
          printData(key: "update addons status response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());

              Get.back();
              // isLoader?.value = false;
              await getAddonsListAPI(isLoader: con.isLoading, isInitial: true);
              // Get.offAllNamed(AppRoutes.loginScreen);
              // Get.back();
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

//delete addons api
  Future<dynamic> deleteAddonsApiCall(String addonId, {RxBool? isLoader}) async {
    final AddonsController con = Get.find<AddonsController>();
    try {
      isLoader?.value = true;
      await APIFunction().deleteApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.deleteAddonsUrl}/$addonId").then(
        (response) async {
          printData(key: "delete addons response", value: response);
          if (!isValEmpty(response) && response["success"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              // Get.offAllNamed(AppRoutes.loginScreen);
              // Get.back();

              // Get.back();
              // isLoader?.value = false;
              await getAddonsListAPI(isLoader: con.isLoading, isInitial: true);
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
      Get.back();
      isLoader?.value = false;
    }
  }

  ///get category list api
  Future<dynamic> getCategoryListAPI({required RxBool isLoader}) async {
    final AddFoodController con = Get.find<AddFoodController>();
    try {
      isLoader.value = true;
      if (await getConnectivityResult()) {
        await APIFunction()
            .getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getCategoryUrl}")
            // "?page=${con.page.value}")
            .then(
          (response) async {
            printData(key: "get category response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetCategoryModel getCategoryResponse = GetCategoryModel.fromJson(response);

              con.getCategoryList.add(GetCategoryDatum(categoryName: 'Select Category'));
              con.getCategoryList.addAll(getCategoryResponse.data!);
              con.selectCategoryDropDownValue.value = con.getCategoryList[0];
              con.getCategoryList.refresh();
            }

            await getRestaurantAddonListAPI(isLoader: isLoader);
            return response;
          },
        );
      }
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader.value = false;
    }
  }

  ///get sub category list api
  Future<dynamic> getSubCategoryListAPI({required RxBool isLoader, required String categoryId}) async {
    final AddFoodController con = Get.find<AddFoodController>();
    try {
      isLoader.value = true;
      if (await getConnectivityResult()) {
        await APIFunction()
            .getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getSubCategoryUrl}/$categoryId")
            // "?page=${con.page.value}")
            .then(
          (response) async {
            printData(key: "get sub category response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetSubCategoryModel getSubCategoryResponse = GetSubCategoryModel.fromJson(response);

              // con.getSubCategoryList.add(
              //     GetSubCategoryDatum(categoryName: 'Select Sub Category'));
              con.getSubCategoryList.addAll(getSubCategoryResponse.data!);
              con.selectSubCategoryDropDownValue.value = con.getSubCategoryList[0];
              con.getSubCategoryList.refresh();
            }
            return response;
          },
        );
      }
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader.value = false;
    }
  }

  ///get restaurant addons list api
  Future<dynamic> getRestaurantAddonListAPI({required RxBool isLoader}) async {
    final AddFoodController con = Get.find<AddFoodController>();
    try {
      if (await getConnectivityResult()) {
        await APIFunction().getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getRestaurantAddonsUrl}").then(
          (response) async {
            printData(key: "get restaurant addons response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetRestaurantAddonsModel getRestaurantAddonsModel = GetRestaurantAddonsModel.fromJson(response);
              getRestaurantAddonsModel.data?.forEach((element) {
                con.getRestaurantAddonsList.add(element);
              });
            }
            return response;
          },
        );
      }
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
      }
    } finally {
      isLoader.value = false;
    }
  }

//add food api call
  Future<dynamic> addFoodApiCall({required RxBool isLoader}) async {
    final AddFoodController con = Get.find<AddFoodController>();

    try {
      isLoader.value = true;
      // "variant": [
      //         {
      //           "name": "test",
      //           "values": [
      //             {"label": "test option", "optionPrice": "12"},
      //             {"label": "test2 option", "optionPrice": "13"}
      //           ]
      //         },
      //         {
      //           "name": "test_second",
      //           "values": [
      //             {"label": "test option second", "optionPrice": "122"},
      //             {"label": "test2 option second", "optionPrice": "133"}
      //           ]
      //         }
      //       ],
      dio.FormData formData = dio.FormData.fromMap({
        "food_name": con.foodNameCon.value.text.trim(),
        "description": con.shortDesCon.value.text.trim(),
        "category_id": con.selectCategoryDropDownValue.value.id,
        "sub_category_id": con.selectSubCategoryDropDownValue.value.id,
        "add_ons": con.selectedAddons,
        "base_price": con.priceCon.value.text,
        "discount_type": con.selectDiscountTypeDropDownValue.value.name,
        "discount": con.discountCon.value.text.trim(),
        "price": "20", // con.disPriceCon.value.text.trim(),
        "veg": con.selectItemTypeDropDownValue.value.id,
        "min_qty": con.minimumQtyCon.value.text.trim(),
        "max_qty": con.totalQtyCon.value.text.trim(),
        "tags": con.tagCon.value.text.trim(),
        "available_time_starts": con.startTimeCon.value.text.trim(),
        "available_time_ends": con.endTimeCon.value.text.trim(),
        if (con.apiImage?.path != null) "image": await dio.MultipartFile.fromFile(con.apiImage!.path, filename: con.imagePath.value.split("/").last)
      });
      await APIFunction().postApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.addFoodUrl}", params: formData).then(
        (response) async {
          printData(key: "add food response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              await getFoodListAPI(isLoader: isLoader, isInitial: true);
              Get.back();
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

  // //get order history filer api call
  // Future<dynamic> getOrderHistoryFilterApiCall(
  //     {RxBool? isLoader,
  //     String? search,
  //     required String fromdDate,
  //     required String toDate}) async {
  //   final OrderManagementController con = Get.find<OrderManagementController>();
  //   try {
  //     isLoader?.value = true;
  //     dio.FormData formData = dio.FormData.fromMap({
  //       "search": search ?? "",
  //       "from_date": fromdDate,
  //       "to_date": toDate,
  //     });
  //     await APIFunction()
  //         .postApiCall(
  //             apiName: "${ApiUrls.getOrderHistoryFilterUrl}", params: formData)
  //         .then(
  //       (response) async {
  //         printData(key: "get order history filter response", value: response);
  //         if (!isValEmpty(response) && response["status"] == true) {
  //           GetOrderHistoryFilterModel getOrderHistoryFiltermodel =
  //               GetOrderHistoryFilterModel.fromJson(response);
  //           getOrderHistoryFiltermodel.data?.data?.forEach((element) {
  //             // log("-------------${element.restaurant}");
  //             // log("-------------${element.restaurant != null}");
  //             if (element != null) {
  //               con.getOrderHistoryFilterList.add(element);
  //             }
  //           });
  //           con.getOrderHistoryFilterList.refresh();
  //           log(con.getOrderHistoryFilterList.length.toString());
  //         }
  //         return response;
  //       },
  //     );
  //   } on dio.DioException catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       printWarning(e.response?.statusCode);
  //       printError(type: this, errText: "$e");
  //     }
  //   } finally {
  //     isLoader?.value = false;
  //   }
  // }

  ///get order history filer api call
  Future<dynamic> getOrderHistoryFilterApiCall({required bool isInitial, String? search, required String fromdDate, required String toDate}) async {
    final OrderManagementController con = Get.find<OrderManagementController>();
    try {
      if (await getConnectivityResult()) {
        if (isInitial) {
          con.getOrderHistoryFilterList.clear();
          con.page.value = 1;
          con.isLoader.value = true;
          con.nextPageStop.value = true;
        }
        if (con.nextPageStop.isTrue) {
          dio.FormData formData = dio.FormData.fromMap({
            "search": search ?? "",
            "from_date": fromdDate,
            "to_date": toDate,
          });
          await APIFunction()
              .postApiCall(apiName: "${ApiUrls.getOrderHistoryFilterUrl}?per_page=${con.page.value}", params: formData)
              .then((response) async {
            printData(key: "get order history filter response", value: response);
            if (!isValEmpty(response) && response["status"] == true) {
              GetOrderHistoryFilterModel getOrderHistoryFiltermodel = GetOrderHistoryFilterModel.fromJson(response);
              // getOrderHistoryFiltermodel.data?.data?.forEach((element) {
              //           // log("-------------${element.restaurant}");
              //           // log("-------------${element.restaurant != null}");
              //           if (element != null) {
              //             con.getOrderHistoryFilterList.add(element);
              //           }
              //         });

              // con.getOrderHistoryFilterList.refresh();

              getOrderHistoryFiltermodel.data!.data?.forEach((element) {
                con.getOrderHistoryFilterList.add(element);
              });
              con.getOrderHistoryFilterList.refresh();

              con.page.value++;
              printData(key: "addon length", value: con.getOrderHistoryFilterList.length);
              if (con.getOrderHistoryFilterList.length == getOrderHistoryFiltermodel.data?.total) {
                con.nextPageStop.value = false;
              }
            }
            return response;
          });
        }
      }
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) {
        printWarning(e.response?.statusCode);
        printError(type: this, errText: "$e");
        toast(e.message);
      } else {
        toast(e.message);
      }
    } finally {
      con.isLoader.value = false;
    }
  }

//add food api call
  Future<dynamic> updateFoodApiCall({required RxBool isLoader, required String foodId}) async {
    final AddFoodController con = Get.find<AddFoodController>();

    try {
      isLoader.value = true;
      // "variant": [
      //         {
      //           "name": "test",
      //           "values": [
      //             {"label": "test option", "optionPrice": "12"},
      //             {"label": "test2 option", "optionPrice": "13"}
      //           ]
      //         },
      //         {
      //           "name": "test_second",
      //           "values": [
      //             {"label": "test option second", "optionPrice": "122"},
      //             {"label": "test2 option second", "optionPrice": "133"}
      //           ]
      //         }
      //       ],

      printYellow(con.foodNameCon.value.text.trim());
      printYellow(con.shortDesCon.value.text.trim());
      dio.FormData formData = dio.FormData.fromMap({
        "food_name": con.foodNameCon.value.text.trim(),
        "description": con.shortDesCon.value.text.trim(),
        "category_id": con.selectCategoryDropDownValue.value.id,
        "sub_category_id": con.selectSubCategoryDropDownValue.value.id,
        "add_ons": con.selectedAddons,
        "base_price": con.priceCon.value.text,
        "discount_type": con.selectDiscountTypeDropDownValue.value.name,
        "discount": con.discountCon.value.text.trim(),
        "price": con.disPriceCon.value.text.trim(),
        "veg": con.selectItemTypeDropDownValue.value.id,
        "min_qty": con.minimumQtyCon.value.text.trim(),
        "max_qty": con.totalQtyCon.value.text.trim(),
        "tags": con.tagCon.value.text.trim(),
        "available_time_starts": con.startTimeCon.value.text.trim(),
        "available_time_ends": con.endTimeCon.value.text.trim(),
        "image": con.image.value != null
            ? dio.MultipartFile.fromString(con.image.value, filename: con.image.value.split("/").last)
            : await dio.MultipartFile.fromFile(con.apiImage!.path, filename: con.imagePath.value.split("/").last)
      });
      await APIFunction().postApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.updateFoodUrl}/$foodId", params: formData).then(
        (response) async {
          printData(key: "update food response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              await DesktopRepository().getFoodListAPI(isLoader: isLoader, isInitial: true);
              Get.back();
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

//delete addons api
  Future<dynamic> deleteFoodApiCall({
    RxBool? isLoader,
    required String foodId,
  }) async {
    try {
      isLoader?.value = true;
      await APIFunction().deleteApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.deleteFoodUrl}/$foodId").then(
        (response) async {
          printData(key: "delete food response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              // Get.offAllNamed(AppRoutes.loginScreen);
              // Get.back();
              await DesktopRepository().getFoodListAPI(
                isInitial: true,
                isLoader: isLoader!,
              );
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
      Get.back();
      isLoader?.value = false;
    }
  }

  //get current order status list api call
  Future<dynamic> getCurrentOrderStatusListApiCall({RxBool? isLoader}) async {
    final con = Get.find<HomeController>();

    try {
      await APIFunction().getApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.getCurrentOrderStatusListUrl}").then(
        (response) async {
          con.getCurrentOrderStatusListData.clear();
          printData(key: "get current order status list response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            CurrentOrderStatusModel getCurrentStatusData = CurrentOrderStatusModel.fromJson(response);

            con.getCurrentOrderStatusListData.add(CurrentOrderStatusDatum(statusName: 'Select order status'));
            con.getCurrentOrderStatusListData.addAll(getCurrentStatusData.data!);
            con.orderstatusDropDownValue.value = con.getCurrentOrderStatusListData[0];
            con.getCurrentOrderStatusListData.refresh();
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

//update order status  api call
  Future<dynamic> updateOrderStatusApiCall({RxBool? isLoader, dynamic params}) async {
    try {
      isLoader?.value = true;

      await APIFunction().postApiCall(apiName: '${ApiUrls.restaurantUrl}${ApiUrls.updateCurrentOrderStatusUrl}', params: params).then(
        (response) async {
          printData(key: "update order status response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
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

  //update food status api
  Future<dynamic> updateFoodStatusApiCall(String foodId, {required RxBool isLoader, dynamic params}) async {
    final FoodController con = Get.find<FoodController>();
    con.getOrderDataList.clear();
    try {
      isLoader.value = true;
      await APIFunction().postApiCall(apiName: "${ApiUrls.restaurantUrl}${ApiUrls.updateFoodStatus}/$foodId", params: params).then(
        (response) async {
          printData(key: "update food status response", value: response);
          if (!isValEmpty(response) && response["status"] == true) {
            if (!isValEmpty(response["message"])) {
              toast(response["message"].toString());
              // Get.offAllNamed(AppRoutes.loginScreen);
              // Get.back();
            }
          }
          await getFoodListAPI(isLoader: isLoader, isInitial: true);
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
}
