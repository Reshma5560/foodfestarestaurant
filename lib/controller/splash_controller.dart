import 'dart:async';

import 'package:foodfestarestaurant/utils/local_storage.dart';
import 'package:get/get.dart';

import '../route/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  navigation() {
    Timer(const Duration(seconds: 5), () {
      if (LocalStorage.token.value.isEmpty) {
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        Get.offAllNamed(AppRoutes.bottomScreen);
      }
    });
  }
}
