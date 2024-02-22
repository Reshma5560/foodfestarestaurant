import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/data/models/get_order_history_filter_model.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:get/get.dart';

class OrderManagementController extends GetxController {
  RxBool isLoader = false.obs;
  RxString fromDate = "".obs;
  RxString toDate = "".obs;

  RxList<GetOrderHistoryFilterDatum> getOrderHistoryFilterList =
      <GetOrderHistoryFilterDatum>[].obs;

  ScrollController orderHistoryFilterScrollController = ScrollController();
  TextEditingController complaintMessageCon = TextEditingController();
  RxBool complaintMessageValidation = false.obs;
  RxString complaintMessageError = ''.obs;

  RxBool paginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxInt page = 1.obs;

  Rx<TextEditingController> nameCon = TextEditingController().obs;
  Rx<TextEditingController> fromDateCon = TextEditingController().obs;
  Rx<TextEditingController> toDateCon = TextEditingController().obs;

  getCurrentDate() {
    final now = DateTime.now();
    var date = DateTime(now.year, now.month, 1).toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.year}-${dateParse.month}-${dateParse.day}";
    fromDate.value = formattedDate.toString();

    DateTime lastDayCurrentMonth =
        DateTime.utc(DateTime.now().year, DateTime.now().month + 1)
            .subtract(const Duration(days: 1));
    toDate.value =
        "${lastDayCurrentMonth.year}-${lastDayCurrentMonth.month}-${lastDayCurrentMonth.day}";
    fromDateCon.value.text = fromDate.value;
    toDateCon.value.text = toDate.value;
    log(fromDate.value);
    log(toDate.value);
  }

  @override
  Future<void> onReady() async {
    await DesktopRepository().getOrderHistoryFilterApiCall(
      isInitial: true,
      fromdDate: fromDateCon.value.text,
      toDate: toDateCon.value.text,
    );
    manageOrderHistoryFilerListScrollController();
    super.onReady();
  }

  @override
  void onInit() {
    getCurrentDate();

    super.onInit();
  }

  void manageOrderHistoryFilerListScrollController() async {
    orderHistoryFilterScrollController.addListener(
      () {
        if (orderHistoryFilterScrollController.position.maxScrollExtent ==
                orderHistoryFilterScrollController.position.pixels &&
            isLoader.isFalse) {
          if (nextPageStop.isTrue && paginationLoading.isFalse) {
            paginationLoading.value = true;
            DesktopRepository().getOrderHistoryFilterApiCall(
              isInitial: false,
              fromdDate: fromDateCon.value.text,
              toDate: toDateCon.value.text,
            );
          }
        }
      },
    );
  }
}
