import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/data/models/complete_order_model.dart';
import 'package:foodfestarestaurant/data/models/current_order_model.dart';
import 'package:foodfestarestaurant/data/models/request_order_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxInt tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool paginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxInt page = 1.obs;

  final List<Tab> orderTabList = <Tab>[
    const Tab(text: 'Current Order'),
    const Tab(text: 'Request Order'),
    const Tab(text: 'Complete Order'),
  ];

  final GlobalKey<ScaffoldState> scaffoldDrawerKey = GlobalKey<ScaffoldState>();

  RxList<CurrentOrderDatum> currentOrderListData = <CurrentOrderDatum>[].obs;

  RxList<RequestOrderDatum> requestOrderListData = <RequestOrderDatum>[].obs;

  RxList<CompleteOrderDatum> completeOrderListData = <CompleteOrderDatum>[].obs;
  @override
  void onInit() {
    tabController = TabController(length: orderTabList.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }
}
