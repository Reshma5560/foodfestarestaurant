import 'dart:io';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:get/get.dart';

import '../../data/models/get_profile_model.dart';

class ProfileController extends GetxController {
  RxBool isLoader = false.obs;

  File? selectedProfileImage;
  GetProfileModel? getDataMap;

  @override
  void onReady() {
    DesktopRepository().getProfileApiCall(isLoader: isLoader);
    super.onReady();
  }
}
