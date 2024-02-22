import 'package:foodfestarestaurant/data/models/get_ny_earning_model.dart';
import 'package:foodfestarestaurant/repositories/account_repositories.dart';
import 'package:get/get.dart';

class MyEarningController extends GetxController {
  RxBool isLoader = true.obs;

  Rx<GetMyEarningModel> myEarningData =
      GetMyEarningModel().obs;

  @override
  Future<void> onReady() async {
    await AccountRepository().getEarningApiCall(isLoader: isLoader);
    super.onReady();
  }
}
