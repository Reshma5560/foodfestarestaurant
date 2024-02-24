import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/data/models/complete_order_model.dart';
import 'package:foodfestarestaurant/data/models/cureent_order_status_model.dart';
import 'package:foodfestarestaurant/data/models/current_order_model.dart';
import 'package:foodfestarestaurant/data/models/request_order_model.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:foodfestarestaurant/utils/local_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxInt tabIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxBool paginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxInt page = 1.obs;

  final List<Tab> orderTabList = <Tab>[
    const Tab(text: 'Current Order'),
    const Tab(text: 'Request Order'),
    const Tab(text: 'Complete Order'),
  ];
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString userImage = "".obs;

  ScrollController currentOrderScrollController = ScrollController();
  ScrollController requestOrderScrollController = ScrollController();
  ScrollController pastOrderScrollController = ScrollController();

  RxList<CurrentOrderDatum> currentOrderListData = <CurrentOrderDatum>[].obs;
  RxList<RequestOrderDatum> requestOrderListData = <RequestOrderDatum>[].obs;
  RxList<CompleteOrderDatum> completeOrderListData = <CompleteOrderDatum>[].obs;

  RxList<CurrentOrderStatusDatum> getCurrentOrderStatusListData =
      <CurrentOrderStatusDatum>[].obs;

  Rx<CurrentOrderStatusDatum> orderstatusDropDownValue =
      CurrentOrderStatusDatum(statusName: 'Select order status').obs;
  @override
  void onInit() {
    firstName.value = LocalStorage.firstName.value;
    lastName.value = LocalStorage.lastName.value;
    userImage.value = LocalStorage.userImage.value;
    tabController = TabController(length: orderTabList.length, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    DesktopRepository().getCurrentOrderListAPI(isInitial: true);

    manageCurrentOrderListScrollController();
    manageRequestOrderListScrollController();
    managePastOrderListScrollController();
    super.onReady();
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  void manageCurrentOrderListScrollController() async {
    currentOrderScrollController.addListener(
      () {
        if (currentOrderScrollController.position.maxScrollExtent ==
                currentOrderScrollController.position.pixels &&
            isLoading.isFalse) {
          if (nextPageStop.isTrue && paginationLoading.isFalse) {
            paginationLoading.value = true;
            DesktopRepository().getCurrentOrderListAPI(isInitial: false);
          }
        }
      },
    );
  }

  void manageRequestOrderListScrollController() async {
    requestOrderScrollController.addListener(
      () {
        if (requestOrderScrollController.position.maxScrollExtent ==
                requestOrderScrollController.position.pixels &&
            isLoading.isFalse) {
          if (nextPageStop.isTrue && paginationLoading.isFalse) {
            paginationLoading.value = true;
            DesktopRepository().getRequestOrderListAPI(isInitial: false);
          }
        }
      },
    );
  }

  void managePastOrderListScrollController() async {
    pastOrderScrollController.addListener(
      () {
        if (pastOrderScrollController.position.maxScrollExtent ==
                pastOrderScrollController.position.pixels &&
            isLoading.isFalse) {
          if (nextPageStop.isTrue && paginationLoading.isFalse) {
            paginationLoading.value = true;
            DesktopRepository().getCompletedOrderListAPI(isInitial: false);
          }
        }
      },
    );
  }
}
