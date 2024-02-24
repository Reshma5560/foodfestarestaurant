import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/data/models/get_category_model.dart';
import 'package:foodfestarestaurant/data/models/get_restaurant_addons_model.dart';
import 'package:foodfestarestaurant/data/models/get_sub_category_model.dart';
import 'package:foodfestarestaurant/data/models/common_model.dart';
import 'package:foodfestarestaurant/data/models/vartiation_model.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFoodController extends GetxController {
  RxBool isEdit = false.obs;
  RxString foodId = "".obs;
  RxBool isLoading = false.obs;

  final RxList<String> items = <String>[].obs;
  final RxList<Widget> textfieldList = <Widget>[].obs;
  final List<TextEditingController> controllers = [];

  RxString imagePath = "".obs;
  File? apiImage;
  RxString image = "".obs;

  RxList<VariationControllerModel> controllerList =
      <VariationControllerModel>[].obs;

      RxList<AdditionalModel> additionalControllerList=<AdditionalModel>[].obs;

  RxList selectedAddons = [].obs;

  Rx<TextEditingController> foodNameCon = TextEditingController().obs;
  RxBool foodNameValidation = false.obs;
  RxString foodNameError = ''.obs;

  Rx<TextEditingController> shortDesCon = TextEditingController().obs;
  RxBool shortDesValidation = false.obs;
  RxString shortDesError = ''.obs;

  Rx<TextEditingController> minimumQtyCon = TextEditingController().obs;
  RxBool minimumQtyValidation = false.obs;
  RxString minimumQtyError = ''.obs;

  Rx<TextEditingController> totalQtyCon = TextEditingController().obs;
  RxBool totalQtyValidation = false.obs;
  RxString totalQtyError = ''.obs;

  Rx<TextEditingController> priceCon = TextEditingController().obs;
  RxBool priceValidation = false.obs;
  RxString priceError = ''.obs;

  Rx<TextEditingController> discountCon = TextEditingController().obs;
  RxBool discountValidation = false.obs;
  RxString discountError = ''.obs;

  Rx<TextEditingController> disPriceCon = TextEditingController().obs;
  RxBool disPriceValidation = false.obs;
  RxString disPriceError = ''.obs;

  Rx<TextEditingController> tagCon = TextEditingController().obs;

  Rx<TextEditingController> startTimeCon = TextEditingController().obs;
  Rx<TextEditingController> endTimeCon = TextEditingController().obs;
  TimeOfDay startTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  TimeOfDay endTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  RxList<GetCategoryDatum> getCategoryList = <GetCategoryDatum>[].obs;

  Rx<GetCategoryDatum> selectCategoryDropDownValue =
      GetCategoryDatum(categoryName: 'Select Category').obs;

  RxList<GetSubCategoryDatum> getSubCategoryList = <GetSubCategoryDatum>[].obs;

  Rx<GetSubCategoryDatum> selectSubCategoryDropDownValue =
      GetSubCategoryDatum(categoryName: 'Select Sub Category').obs;

  RxList<GetRestaurantAddonsDatum> getRestaurantAddonsList =
      <GetRestaurantAddonsDatum>[].obs;

  Rx<GetRestaurantAddonsDatum> selectRestaurantAddonDropDownValue =
      GetRestaurantAddonsDatum(addonName: 'Select addons').obs;

  RxList<ItemTypeModel> itemTypeData = <ItemTypeModel>[].obs;

  Rx<ItemTypeModel> selectItemTypeDropDownValue =
      ItemTypeModel(name: 'Select Item Type', id: 2).obs;

  RxList<ItemTypeModel> discountTypeData = <ItemTypeModel>[].obs;

  Rx<ItemTypeModel> selectDiscountTypeDropDownValue =
      ItemTypeModel(name: 'Select Discount Tyoe', id: 2).obs;

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
    await DesktopRepository().getCategoryListAPI(isLoader: isLoading);
    if (isEdit.isTrue) {
      await DesktopRepository().getFoodDetailsByIdAPI(
        isLoader: isLoading,
        foodId: foodId.value,
      );
    }

    super.onReady();
  }

  @override
  void onInit() {
    itemTypeData.add(ItemTypeModel(name: 'Select Item Type', id: 2));
    itemTypeData.add(
      ItemTypeModel(name: "Veg", id: 1),
    );
    itemTypeData.add(ItemTypeModel(name: "Non Veg", id: 0));
    selectItemTypeDropDownValue.value = itemTypeData[0];
    itemTypeData.refresh();

    discountTypeData.add(ItemTypeModel(name: 'Select Discount type'));
    discountTypeData.add(ItemTypeModel(name: "Amount"));
    discountTypeData.add(ItemTypeModel(name: "Percent"));
    selectDiscountTypeDropDownValue.value = discountTypeData[0];
    discountTypeData.refresh();

    if (Get.arguments != null) {
      isEdit.value = Get.arguments['isEdit'];
      foodId.value = Get.arguments['foodId'];
    }

    super.onInit();
  }
}
