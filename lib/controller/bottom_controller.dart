import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/view/account/account_screen.dart';
import 'package:foodfestarestaurant/view/index/widgets/home_screen.dart';
import 'package:foodfestarestaurant/view/index/widgets/order_screen.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  void changeIndex(int index) async {
    selectedIndex.value = index;
    if (index == 0) {
    } else if (index == 1) {
    } else if (index == 2) {}
  }

  final pages = <Widget>[
    const HomeScreen(),
    const OrderScreen(),
     AccountScreen()
  ];
}
