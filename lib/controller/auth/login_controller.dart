import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/utils/local_storage.dart';
import 'package:get/get.dart';

import '../../res/color_print.dart';

class LoginController extends GetxController {
  // Rx<TextEditingController> mobileNumberCon = TextEditingController().obs;
  // RxString mobileError = "".obs;
  // RxBool isMobileValid = false.obs;
  Rx<TextEditingController> emailCon = TextEditingController().obs;
  RxBool emailValidation = false.obs;
  RxString emailError = ''.obs;

  Rx<TextEditingController> passwordCon = TextEditingController().obs;
  RxBool passwordValidation = false.obs;
  RxString passwordError = ''.obs;

  RxBool buttonPress = false.obs;
  RxBool isLoading = false.obs;

  RxBool isRemember = false.obs;
  RxBool passwordVisible = true.obs;

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    // await LocalStorage.readDataInfo();
    if (LocalStorage.email.value.isNotEmpty) {
      emailCon.value.text = LocalStorage.email.value;

      printData(key: "User EMAIL", value: emailCon.value.text);
    }

    if (LocalStorage.password.value.isNotEmpty) {
      passwordCon.value.text = LocalStorage.password.value;
      printData(key: "User EMAIL", value: passwordCon.value.text);
    }

    isRemember = LocalStorage.isRemember;
  }
}
