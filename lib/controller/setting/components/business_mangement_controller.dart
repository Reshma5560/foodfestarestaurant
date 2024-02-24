import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/data/models/get_business_config_model.dart';
import 'package:foodfestarestaurant/data/models/get_cuisine_model.dart';
import 'package:foodfestarestaurant/repositories/account_repositories.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessManagementController extends GetxController {
  RxBool isLoader = false.obs;

  RxString imagePath = "".obs;
  File? apiImage;
  RxString image = "".obs;

  RxBool selectCloseRes = false.obs;
  RxBool selectSchedule = false.obs;
  RxBool selectHome = false.obs;
  RxBool selectTakeaway = false.obs;
  RxBool selectVeg = false.obs;
  RxBool selectNonVeg = false.obs;
  RxBool selectCutlery = false.obs;

  Rx<TextEditingController> minimunQtyAmountCon = TextEditingController().obs;
  Rx<TextEditingController> gstCon = TextEditingController().obs;
  Rx<TextEditingController> cuisineCon = TextEditingController().obs;
  Rx<TextEditingController> tagCon = TextEditingController().obs;


  RxList selectedCuisine = [].obs;

  Rx<TextEditingController> metatTitleCon = TextEditingController().obs;
  Rx<TextEditingController> metaDescCon = TextEditingController().obs;

  Rx<GetBusinessConfigData> getBusinessConfigData = GetBusinessConfigData().obs;

  RxList<GetCuisineDatum> getCuisineListData = <GetCuisineDatum>[].obs;

  RxList<String> selectedChoice = <String>[].obs;
  showImagePickerBottomSheet() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: Get.context!,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
                  child: Text(
                    "Albums",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: Icon(
                Icons.camera_alt_rounded,
                color: AppColors.grey,
                size: 25,
              ),
              title: const Text("Camera"),
              onTap: () {
                Get.back();
                selectImage(pickFromCamera: true);
              },
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: Icon(
                Icons.perm_media_rounded,
                color: AppColors.grey,
                size: 25,
              ),
              title: const Text("Library"),
              onTap: () {
                Get.back();
                selectImage(pickFromCamera: false);
              },
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: Icon(
                Icons.close,
                color: AppColors.grey,
                size: 25,
              ),
              title: const Text("Cancel"),
              onTap: () {
                Get.back();
              },
            ),
          ]);
        });
  }

  selectImage({bool pickFromCamera = false}) async {
    image.value = "";
    XFile? pickedImage = await ImagePicker().pickImage(
      source: pickFromCamera == true ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedImage != null) {
      apiImage = File(pickedImage.path);
      imagePath.value = pickedImage.path;
      log("API IMAGE ${apiImage?.path}");
      log("IMAGE PATH ${imagePath.value}");
    }
  }

  @override
  Future<void> onReady() async {
    await AccountRepository()
        .getBusinessManagementConfigApiCall(isLoader: isLoader);
    super.onReady();
  }
}
