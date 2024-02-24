import 'package:foodfestarestaurant/data/models/get_customer_data_model.dart';
import 'package:foodfestarestaurant/repositories/account_repositories.dart';
import 'package:get/get.dart';

class DisplayCustomerController extends GetxController {
  Rx<GetCustomerModel> getCustomerDataModel = GetCustomerModel().obs;

  RxList<GetCustomerDatum> getCustomerListData =
      <GetCustomerDatum>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onReady() {
    AccountRepository().getCustomerApiCall(isLoader: isLoading);
    super.onReady();
  }
}
