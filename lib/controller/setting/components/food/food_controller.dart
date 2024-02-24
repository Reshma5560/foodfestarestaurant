import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/data/models/get_food-model.dart';
import 'package:get/get.dart';

import '../../../../../../repositories/desktop_repository.dart';

class FoodController extends GetxController {
  Rx<GetFoodModel> getOrderDataModel = GetFoodModel().obs;
  RxBool isLoading = true.obs;

  RxBool paginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxInt page = 10.obs;

  RxList<GetFoodDatum> getOrderDataList = <GetFoodDatum>[].obs;

  ScrollController getFoodListScrollController = ScrollController();
  @override
  Future<void> onReady() async {
    await DesktopRepository()
        .getFoodListAPI(isLoader: isLoading, isInitial: true);
    manageGetFoodListListScrollController();
    super.onReady();
  }

  void manageGetFoodListListScrollController() async {
    getFoodListScrollController.addListener(
      () {
        if (getFoodListScrollController.position.maxScrollExtent ==
                getFoodListScrollController.position.pixels &&
            isLoading.isFalse) {
          if (nextPageStop.isTrue && paginationLoading.isFalse) {
            paginationLoading.value = true;
            DesktopRepository()
                .getFoodListAPI(isLoader: isLoading, isInitial: false);
          }
        }
      },
    );
  }
}
