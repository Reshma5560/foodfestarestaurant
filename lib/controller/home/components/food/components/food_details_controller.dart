import 'package:foodfestarestaurant/data/models/get_food_details_model.dart';
import 'package:get/get.dart';

import '../../../../../../../repositories/desktop_repository.dart';

class FoodDetailsController extends GetxController {
  Rx<GetFoodDetailsModel> getFoodDetailModel = GetFoodDetailsModel().obs;
  RxBool isLoading = true.obs;

  RxString foodId = "".obs;

  @override
  void onInit() {
    print(Get.arguments['foodId']);
    foodId.value = Get.arguments['foodId'];
    print(foodId.value);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await DesktopRepository().getFoodDetailsByIdAPI(
      isLoader: isLoading,
      foodId: foodId.value,
    );
    super.onReady();
  }
}
