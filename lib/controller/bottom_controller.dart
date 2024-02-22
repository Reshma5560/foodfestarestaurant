import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/view/index/widgets/order/order_management_screen.dart';
import 'package:get/get.dart';

import '../view/account/account_screen.dart';
import '../view/index/widgets/home/home_screen.dart';

class BottomController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  void changeIndex(int index) async {
    selectedIndex.value = index;
    if (index == 0) {
    } else if (index == 1) {
    } else {}
  }

  final pages = <Widget>[
    HomeScreen(),
    OrderManagementScreen(),
    AccountScreen()
  ];
}
