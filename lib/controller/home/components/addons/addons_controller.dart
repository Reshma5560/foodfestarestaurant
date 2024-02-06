// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/data/models/get_addons_model.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:get/get.dart';

class AddonsController extends GetxController {
  Rx<GetAddonsModel> getAddonsDataModel = GetAddonsModel().obs;
  RxBool isLoading = true.obs;

  Rx<TextEditingController> nameCon = TextEditingController().obs;
  RxBool nameValidation = false.obs;
  RxString nameError = ''.obs;

  Rx<TextEditingController> priceCon = TextEditingController().obs;
  RxBool priceValidation = false.obs;
  RxString priceError = ''.obs;

  @override
  Future<void> onReady() async {
    await DesktopRepository().getAddonsListAPI(
      isLoader: isLoading,
    );
    super.onReady();
  }
}
