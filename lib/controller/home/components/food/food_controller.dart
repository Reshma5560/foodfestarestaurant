import 'package:foodfestarestaurant/data/models/get_food-model.dart';
import 'package:get/get.dart';

import '../../../../../../repositories/desktop_repository.dart';

class FoodController extends GetxController {
  Rx<GetFoodModel> getOrderDataModel = GetFoodModel().obs;
  RxBool isLoading = true.obs;


  @override
  Future<void> onReady() async {
    await DesktopRepository().getFoodListAPI(
      isLoader: isLoading,
    );
    super.onReady();
  }
}
