import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/utils/local_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Rx<TextEditingController> mobileNumberCon = TextEditingController().obs;
  // RxString mobileError = "".obs;
  // RxBool isMobileValid = false.obs;
  Rx<TextEditingController> emailCon =
      TextEditingController(text: kDebugMode ? "italian@gmail.com" : "").obs;
  RxBool emailValidation = false.obs;
  RxString emailError = ''.obs;

  Rx<TextEditingController> passwordCon =
      TextEditingController(text: kDebugMode ? "123456789" : "").obs;
  RxBool passwordValidation = false.obs;
  RxString passwordError = ''.obs;

  RxBool buttonPress = false.obs;
  RxBool isLoading = false.obs;

  
  RxBool isRemeber = false.obs;
  RxBool passwordVisible = false.obs;

  
  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    // await LocalStorage.readDataInfo();
    if (LocalStorage.isRemeber.value == true) {
      isRemeber.value = true;
      emailCon.value.text = LocalStorage.loginEmail.value;
      passwordCon.value.text = LocalStorage.loginPassword.value;
    }
  }
}
