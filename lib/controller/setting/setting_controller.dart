import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:get/get.dart';
import '../../data/models/get_profile_model.dart';

class SettingController extends GetxController {
  RxBool isLoader = false.obs;

  RxString userApiImageFile = "".obs;
  GetProfileModel? getDataMap;

  RxString userName = "".obs;
  RxString phoneNoName = "".obs;
  RxString email = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;

  @override
  void onReady() {
    DesktopRepository().getProfileApiCall(isLoader: isLoader);
    super.onReady();
  }
}
