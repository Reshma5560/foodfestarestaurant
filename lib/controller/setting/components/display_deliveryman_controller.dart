import 'package:foodfestarestaurant/data/models/get_deliveryman_data_model.dart';
import 'package:foodfestarestaurant/repositories/account_repositories.dart';
import 'package:get/get.dart';

class DisplayDeliveryManController extends GetxController {
  Rx<GetDeliveryManDataModel> getDeliveryManDataModel =
      GetDeliveryManDataModel().obs;

  RxList<GetDeliveryManDatum> getDeliverymanListData =
      <GetDeliveryManDatum>[].obs;

      RxBool isLoading=true.obs;

  @override
  void onReady() {
    AccountRepository().getDeliverymanApiCall(isLoader: isLoading);
    super.onReady();
  }
}
