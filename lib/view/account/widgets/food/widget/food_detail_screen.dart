import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/controller/account/components/food/components/food_details_controller.dart';
import 'package:foodfestarestaurant/res/app_appbar.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:get/get.dart';

class FoodDetailsScreen extends StatelessWidget {
  FoodDetailsScreen({super.key});

  final FoodDetailsController con = Get.put(FoodDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCubic,
            tween: Tween(begin: 20.0, end: 1.0),
            builder: (context, value, child) {
              return AnimatedOpacity(
                  opacity: value == 20 ? 0 : 1,
                  duration: const Duration(milliseconds: 700),
                  child: Column(children: [
                    CommonAppBar(
                      title: "Food Detail",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                        child: Obx(() => con.isLoading.isTrue
                            ? const AppLoader()
                            : Container()))
                  ]));
            }));
  }
}
