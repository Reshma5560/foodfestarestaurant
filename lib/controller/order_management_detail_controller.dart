
import 'package:foodfestarestaurant/data/models/get_order_by_id_model.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:get/get.dart';

class OrderManagementDetailController extends GetxController {
  Rx<GetOrderByIdModel> getOrderDataModel = GetOrderByIdModel().obs;

  RxBool isLoading = true.obs;
  RxString orderId = "".obs;

  @override
  void onInit() {
    orderId.value = Get.arguments['orderId'];
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await DesktopRepository().getOrderByIdApiCall(
        isLoader: isLoading,
        orderId: orderId.value,
        orderData:
            getOrderDataModel); // "9b3acdb9-facd-48f7-b42b-808a47ee202a");
    super.onReady();
  }
}
