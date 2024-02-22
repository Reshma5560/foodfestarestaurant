import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/account/components/food/components/add_food_controller.dart';
import 'package:foodfestarestaurant/data/models/get_category_model.dart';
import 'package:foodfestarestaurant/data/models/get_sub_category_model.dart';
import 'package:foodfestarestaurant/data/models/common_model.dart';
import 'package:foodfestarestaurant/data/models/vartiation_model.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:foodfestarestaurant/res/app_appbar.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_text_field.dart';
import 'package:foodfestarestaurant/res/color_print.dart';
import 'package:get/get.dart';

class AddFoodScreen extends StatelessWidget {
  AddFoodScreen({super.key});

  final AddFoodController con = Get.put(AddFoodController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCubic,
            tween: Tween(begin: 20.0, end: 1.0),
            builder: (context, value, child) {
              return AnimatedOpacity(
                  opacity: value == 20 ? 0 : 1,
                  duration: const Duration(milliseconds: 700),
                  child: Column(children: [
                    CommonAppBar(
                      title: con.isEdit.value ? "Update Food" : "Create Food",
                      isLeadingShow: true,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                        child: Obx(() => con.isLoading.isTrue
                            ? const AppLoader()
                            : Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(Get.context!)
                                      .colorScheme
                                      .background,
                                  border: Border.all(
                                      width: 2,
                                      color:
                                          Theme.of(Get.context!).primaryColor),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ListView(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 10.h),
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    _imageModule(),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text(
                                      "Fodd Inforamtion",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      // height: 40,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.foodNameCon.value,
                                        errorMessage: con.foodNameError.value,
                                        showError: con.foodNameValidation.value,
                                        hintText: "Food Name",
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          con.foodNameValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      // height: 80,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.shortDesCon.value,
                                        errorMessage: con.shortDesError.value,
                                        showError: con.shortDesValidation.value,
                                        hintText: "Short Description",
                                        maxLines: 2,
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          con.shortDesValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    Text(
                                      "Fodd Details",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    _itemTypeDropDownModule(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    _categoryDropDownModule(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    _subCategoryDropDownModule(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      // height: 40,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.minimumQtyCon.value,
                                        errorMessage: con.minimumQtyError.value,
                                        showError:
                                            con.minimumQtyValidation.value,
                                        hintText: "Minimum Allow Quantity",
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          con.minimumQtyValidation.value =
                                              false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      // height: 40,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.totalQtyCon.value,
                                        errorMessage: con.totalQtyError.value,
                                        showError: con.totalQtyValidation.value,
                                        hintText: "Total Allow Quantity",
                                        maxLines: 2,
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          con.totalQtyValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    // _addonsDropDownModule(),
                                    AppTextField(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          borderSide: BorderSide(
                                              color: AppColors.white)),
                                      // controller: con.nameCon.value,
                                      // errorMessage: con.nameError.value,
                                      // showError: con.nameValidation.value,
                                      hintText: "Addons",
                                      suffixOnTap: () {
                                        getAddonscheckList();
                                      },
                                      suffixIcon:
                                          const Icon(Icons.arrow_downward),
                                      hintStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.hintColor),
                                      onChanged: (value) {
                                        // con.nameValidation.value = false;
                                      },
                                    ),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    Text(
                                      "Amount",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      // height: 40,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.priceCon.value,
                                        errorMessage: con.priceError.value,
                                        showError: con.priceValidation.value,
                                        hintText: "Bas Price",
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          con.priceValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    _discountTypeDropDownModule(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      // height: 40,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.discountCon.value,
                                        errorMessage: con.discountError.value,
                                        showError: con.discountValidation.value,
                                        hintText: "Discount",
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          con.discountValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      // height: 40,
                                      child: AppTextField(
                                        enabled: false,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.disPriceCon.value,
                                        errorMessage: con.disPriceError.value,
                                        showError: con.disPriceValidation.value,
                                        hintText: "Discount Price",
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          con.disPriceValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    Text(
                                      "Tag",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.tagCon.value,
                                        // errorMessage: con.nameError.value,
                                        // showError: con.nameValidation.value,
                                        hintText: "Enter Tags (Ex: tag1, tag2, tag3)",
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          // con.nameValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Food Variations",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // con.controllers
                                            //     .add(TextEditingController());

                                            printYellow("-----------------");
                                            con.controllerList.add(
                                                VariationControllerModel());

                                            print(con.controllerList.length);
                                            // con.additionalControllerList
                                            //     .add(AdditionalModel());
                                            // Get.forceAppUpdate();
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 16.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    _variation(),
                                    // _variatrionModule(),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    Text(
                                      "Time Schedule",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.startTimeCon.value,
                                        // errorMessage: con.nameError.value,
                                        // showError: con.nameValidation.value,
                                        hintText: "Available Time Start",
                                        suffixOnTap: selectStartTime,
                                        suffixIcon:
                                            const Icon(Icons.lock_clock),
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          // con.nameValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: AppTextField(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            borderSide: BorderSide(
                                                color: AppColors.white)),
                                        controller: con.endTimeCon.value,
                                        // errorMessage: con.nameError.value,
                                        // showError: con.nameValidation.value,
                                        hintText: "Available Time End",
                                        suffixOnTap: selectEndTime,
                                        suffixIcon:
                                            const Icon(Icons.lock_clock),
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor),
                                        onChanged: (value) {
                                          // con.nameValidation.value = false;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    AppButton(
                                        height: 40,
                                        // backgroundColor:
                                        //     Theme.of(context).primaryColor,
                                        onPressed: () {
                                          if (con.isEdit.isFalse) {
                                            DesktopRepository().addFoodApiCall(
                                                isLoader: con.isLoading);
                                          } else {
                                            DesktopRepository()
                                                .updateFoodApiCall(
                                                    isLoader: con.isLoading,
                                                    foodId: con.foodId.value);
                                          }
                                        },
                                        child: Text(
                                          con.isEdit.value
                                              ? "Update Food"
                                              : "Create Food",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white,
                                          ),
                                        ))
                                  ],
                                ),
                              ).paddingSymmetric(
                                horizontal: 15.w, vertical: 10.h)))
                  ]));
            }));
  }

  Widget _imageModule() {
    return InkWell(
      onTap: () {
        con.showImagePickerBottomSheet();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 90.w),
        height: 120,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: Obx(() => con.imagePath.isNotEmpty
              ? Image.file(
                  io.File(con.imagePath.value),
                  fit: BoxFit.cover,
                )
              : con.image.value.isNotEmpty
                  ? Image.network(
                      con.image.value,
                      fit: BoxFit.cover,
                    )
                  //  LocalStorage.userImage.value.contains("https://") || LocalStorage.userImage.value.contains("http://")
                  //     ? MFNetworkImage(
                  //         imageUrl: LocalStorage.userImage.value,
                  //         fit: BoxFit.cover,
                  //       )
                  : Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        // shape: BoxShape.circle,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_enhance,
                            size: 24,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Add Product\n Photo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          )
                        ],
                      ),
                    )),
        ),
      ),
    );
  }

  getAddonscheckList() {
    return Get.dialog(
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Obx(
              () => Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  con.getRestaurantAddonsList.length,
                  (index) => Material(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      // contentPadding: EdgeInsets.zero,
                      // dense: true,
                      title: Text(
                        con.getRestaurantAddonsList[index].addonName ?? "",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      value: con.getRestaurantAddonsList[index].isTrueValue,
                      onChanged: (value) {
                        con.getRestaurantAddonsList[index].isTrueValue = value!;
                        if (con.selectedAddons
                            .contains(con.getRestaurantAddonsList[index].id)) {
                          con.selectedAddons
                              .remove(con.getRestaurantAddonsList[index].id);
                        } else {
                          con.selectedAddons
                              .add(con.getRestaurantAddonsList[index].id);
                        }
                        con.selectedAddons.refresh();
                      },
                    ),
                  ),
                ),
              ),
            )),
        barrierDismissible: false);
  }

  Widget _categoryDropDownModule() {
    return DropdownButtonFormField<GetCategoryDatum>(
      // menuMaxHeight: 400,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
      hint: Text("Select Category",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.hintColor)),

      value: con.selectCategoryDropDownValue.value,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.grey,
      ),
      items:
          con.getCategoryList.map<DropdownMenuItem<GetCategoryDatum>>((value) {
        // log("value.name ${value.countryName}");
        return DropdownMenuItem<GetCategoryDatum>(
          value: value,
          child: Text(
            "${value.categoryName}",
            style: TextStyle(
              color: AppColors.greyFontColor,
              fontSize: 11.sp,
            ),
          ),
        );
      }).toList(),
      isDense: true,
      isExpanded: false,
      dropdownColor: AppColors.white,
      // underline: Container(height: 1, color: AppColors.blackColor),
      // borderRadius: const BorderRadius.all(Radius.circular(15)),
      style: TextStyle(
        color: AppColors.grey,
        fontSize: 11.sp,
      ),
      onChanged: (value) async {
        con.isLoading(true);
        con.selectCategoryDropDownValue.value = value ?? GetCategoryDatum();
        // con.stateList.clear();
        // con.stateList.add(StateList(stateName: 'Select state'));

        DesktopRepository().getSubCategoryListAPI(
            isLoader: con.isLoading, categoryId: value?.id ?? "");
        con.isLoading(false);
      },
    );
  }

  Widget _subCategoryDropDownModule() {
    return DropdownButtonFormField<GetSubCategoryDatum>(
      // menuMaxHeight: 400,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
      hint: Text("Select Sub Category",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.hintColor)),
      value: con.selectSubCategoryDropDownValue.value,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.grey,
      ),
      items: con.getSubCategoryList
          .map<DropdownMenuItem<GetSubCategoryDatum>>((value) {
        // log("value.name ${value.countryName}");
        return DropdownMenuItem<GetSubCategoryDatum>(
          value: value,
          child: Text(
            "${value.categoryName}",
            style: TextStyle(
              color: AppColors.greyFontColor,
              fontSize: 11.sp,
            ),
          ),
        );
      }).toList(),
      isDense: true,
      isExpanded: false,
      dropdownColor: AppColors.white,
      // underline: Container(height: 1, color: AppColors.blackColor),
      // borderRadius: const BorderRadius.all(Radius.circular(15)),
      style: TextStyle(
        color: AppColors.grey,
        fontSize: 11.sp,
      ),
      onChanged: (value) async {
        con.isLoading(true);
        con.selectSubCategoryDropDownValue.value =
            value ?? GetSubCategoryDatum();
        // con.stateList.clear();
        // con.stateList.add(StateList(stateName: 'Select state'));

        DesktopRepository().getSubCategoryListAPI(
            isLoader: con.isLoading, categoryId: value?.id ?? "");
        con.isLoading(false);
      },
    );
  }

  // Widget _addonsDropDownModule() {
  //   return DropdownButtonFormField<GetRestaurantAddonsDatum>(
  //     // menuMaxHeight: 400,
  //     decoration: InputDecoration(
  //       fillColor: AppColors.white,
  //       filled: true,
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: const BorderRadius.all(Radius.circular(20)),
  //         borderSide: BorderSide(color: AppColors.white),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: const BorderRadius.all(Radius.circular(15)),
  //         borderSide: BorderSide(color: AppColors.white),
  //       ),
  //     ),
  //     hint: Text("Select Addons",
  //         style: TextStyle(
  //             fontSize: 12.sp,
  //             fontWeight: FontWeight.w400,
  //             color: AppColors.hintColor)),
  //     value: con.selectRestaurantAddonDropDownValue.value,
  //     icon: Icon(
  //       Icons.keyboard_arrow_down_rounded,
  //       color: AppColors.grey,
  //     ),
  //     items: con.getRestaurantAddonsList
  //         .map<DropdownMenuItem<GetRestaurantAddonsDatum>>((value) {
  //       return DropdownMenuItem<GetRestaurantAddonsDatum>(
  //         value: value,
  //         child: Text(
  //           "${value.addonName}",
  //           style: TextStyle(
  //             color: AppColors.greyFontColor,
  //             fontSize: 11.sp,
  //           ),
  //         ),
  //       );
  //     }).toList(),
  //     isDense: true,
  //     isExpanded: false,
  //     dropdownColor: AppColors.white,
  //     style: TextStyle(
  //       color: AppColors.grey,
  //       fontSize: 11.sp,
  //     ),
  //     onChanged: (value) async {
  //       con.isLoading(true);
  //       con.selectRestaurantAddonDropDownValue.value =
  //           value ?? GetRestaurantAddonsDatum();
  //       con.isLoading(false);
  //     },
  //   );
  // }

  _itemTypeDropDownModule() {
    return DropdownButtonFormField<ItemTypeModel>(
      // menuMaxHeight: 400,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
      hint: Text("Select Item Type",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.hintColor)),
      value: con.selectItemTypeDropDownValue.value,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.grey,
      ),
      items: con.itemTypeData.map<DropdownMenuItem<ItemTypeModel>>((value) {
        return DropdownMenuItem<ItemTypeModel>(
          value: value,
          child: Text(
            "${value.name}",
            style: TextStyle(
              color: AppColors.greyFontColor,
              fontSize: 11.sp,
            ),
          ),
        );
      }).toList(),
      isDense: true,
      isExpanded: false,
      dropdownColor: AppColors.white,
      style: TextStyle(
        color: AppColors.grey,
        fontSize: 11.sp,
      ),
      onChanged: (value) async {
        con.isLoading(true);
        con.selectItemTypeDropDownValue.value = value ?? ItemTypeModel();

        con.isLoading(false);
      },
    );
  }

  _discountTypeDropDownModule() {
    return DropdownButtonFormField<ItemTypeModel>(
      // menuMaxHeight: 400,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
      hint: Text("Select Discount Type",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.hintColor)),
      value: con.selectDiscountTypeDropDownValue.value,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.grey,
      ),
      items: con.discountTypeData.map<DropdownMenuItem<ItemTypeModel>>((value) {
        return DropdownMenuItem<ItemTypeModel>(
          value: value,
          child: Text(
            "${value.name}",
            style: TextStyle(
              color: AppColors.greyFontColor,
              fontSize: 11.sp,
            ),
          ),
        );
      }).toList(),
      isDense: true,
      isExpanded: false,
      dropdownColor: AppColors.white,
      style: TextStyle(
        color: AppColors.grey,
        fontSize: 11.sp,
      ),
      onChanged: (value) async {
        con.isLoading(true);
        con.selectDiscountTypeDropDownValue.value = value ?? ItemTypeModel();

        con.isLoading(false);
      },
    );
  }

  Widget _variatrionModule() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const RangeMaintainingScrollPhysics(),
      itemCount: con.controllers.length,
      itemBuilder: (context, index) {
        // Check if the last item has been reached to show the add button
        // if (index == con.controllers.length) {
        //   return ElevatedButton(
        //     onPressed: () {
        //       // Add a new TextEditingController to the list
        //       con.controllers.add(TextEditingController());
        //       // Update the UI
        //       Get.forceAppUpdate();
        //     },
        //     child: Text('Add TextField'),
        //   );
        // }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Name",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: con.controllers[index],
                      hintText: "Enter Name",
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  InkWell(
                      onTap: () {
                        con.controllers.removeAt(index);
                        Get.forceAppUpdate();
                      },
                      child: const Icon(Icons.delete))
                ],
              ),
            ],
          ),
        );
      },
    );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    //     Text(
    //       "Name",
    //       style: TextStyle(
    //           color: AppColors.black,
    //           fontSize: 14.sp,
    //           fontWeight: FontWeight.w600),
    //     ),
    //     const AppTextField(),
    //     SizedBox(
    //       height: 5.h,
    //     ),
    //     // Container(
    //     //   decoration: BoxDecoration(
    //     //     color: Theme.of(Get.context!).colorScheme.background,
    //     //     border: Border.all(
    //     //         width: 2, color: Theme.of(Get.context!).primaryColor),
    //     //     borderRadius: const BorderRadius.all(
    //     //       Radius.circular(12),
    //     //     ),
    //     //   ),
    //     //   child: Column(
    //     //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     //     children: [
    //     //       const Align(
    //     //           alignment: Alignment.centerRight,
    //     //           child: Icon(
    //     //             Icons.close,
    //     //             size: 16,
    //     //           )),
    //     //       Text(
    //     //         "Option Name",
    //     //         style: TextStyle(
    //     //             color: AppColors.black,
    //     //             fontSize: 14.sp,
    //     //             fontWeight: FontWeight.w600),
    //     //       ),
    //     //       const AppTextField(),
    //     //       Text(
    //     //         "Additional Price",
    //     //         style: TextStyle(
    //     //             color: AppColors.black,
    //     //             fontSize: 14.sp,
    //     //             fontWeight: FontWeight.w600),
    //     //       ),
    //     //       const AppTextField(),
    //     //       SizedBox(
    //     //         height: 5.h,
    //     //       ),
    //     //       Divider(
    //     //         color: Theme.of(Get.context!).primaryColor,
    //     //       ),
    //     //       const Align(
    //     //           alignment: Alignment.centerRight,
    //     //           child: Icon(Icons.close, size: 16)),
    //     //       Text(
    //     //         "Option Name",
    //     //         style: TextStyle(
    //     //             color: AppColors.black,
    //     //             fontSize: 14.sp,
    //     //             fontWeight: FontWeight.w600),
    //     //       ),
    //     //       const AppTextField(),
    //     //       Text(
    //     //         "Additional Price",
    //     //         style: TextStyle(
    //     //             color: AppColors.black,
    //     //             fontSize: 14.sp,
    //     //             fontWeight: FontWeight.w600),
    //     //       ),
    //     //       const AppTextField(),
    //     //       SizedBox(
    //     //         height: 8.h,
    //     //       ),
    //     //       Row(
    //     //         children: [
    //     //           ElevatedButton(
    //     //               style: ButtonStyle(
    //     //                 backgroundColor: MaterialStatePropertyAll(
    //     //                     Theme.of(Get.context!).primaryColor),
    //     //                 shape:
    //     //                     MaterialStateProperty.all<RoundedRectangleBorder>(
    //     //                   RoundedRectangleBorder(
    //     //                     borderRadius: BorderRadius.circular(5.0),
    //     //                   ),
    //     //                 ),
    //     //               ),
    //     //               onPressed: () {},
    //     //               child: Text(
    //     //                 "Add New Option",
    //     //                 style: TextStyle(
    //     //                     color: AppColors.white,
    //     //                     fontWeight: FontWeight.w500,
    //     //                     fontSize: 12),
    //     //               )),
    //     //           const Spacer(
    //     //             flex: 2,
    //     //           )
    //     //         ],
    //     //       ),
    //     //     ],
    //     //   ).paddingSymmetric(horizontal: 15.w, vertical: 10.h),
    //     // ),
    //     SizedBox(
    //       height: 5.h,
    //     ),
    //     Row(
    //       children: [
    //         ElevatedButton(
    //             style: ButtonStyle(
    //               backgroundColor: MaterialStatePropertyAll(
    //                   Theme.of(Get.context!).primaryColor),
    //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                 RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                 ),
    //               ),
    //             ),
    //             onPressed: () {
    //               // con.items.add('Item ${con.items.length + 1}');
    //                  con.controllers.add(TextEditingController());
    //         con.textfieldList.add(TextField(
    //           controller: con.controllers,
    //           decoration: InputDecoration(
    //             labelText: 'Text ${index + 1}',
    //         )),);

    //             },
    //             child: Text(
    //               "Add New Variation",
    //               style: TextStyle(
    //                   color: AppColors.white,
    //                   fontWeight: FontWeight.w500,
    //                   fontSize: 12),
    //             )),
    //         const Spacer(
    //           flex: 2,
    //         )
    //       ],
    //     ),

    //     SizedBox(
    //       height: 300,
    //       // Use Obx to observe changes in the list and update the UI accordingly
    //       child: Obx(
    //         () => ListView.builder(
    //           itemCount: con.items.length,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               title: Text(con.items[index]),
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  void selectStartTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: Get.context!,
      initialTime: con.startTime,
    );
    if (newTime != null) {
      con.startTime = newTime;
      con.startTimeCon.value.text =
          "${con.startTime.hour}:${con.startTime.minute}";
    }
  }

  void selectEndTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: Get.context!,
      initialTime: con.endTime,
    );
    if (newTime != null) {
      con.endTime = newTime;
      con.endTimeCon.value.text = "${con.endTime.hour}:${con.endTime.minute}";
    }
  }

  Widget _variation() {
    return Obx(() => ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const RangeMaintainingScrollPhysics(),
        itemCount: con.controllerList.length,
        itemBuilder: (context, index) {
          // con.additionalControllerList.add(AdditionalModel());
          // print(con.additionalControllerList.length);
          // con.controllerList[index].additionalController
          //     ?.add(AdditionalModel());
          // con.additionalControllerList
          //     .addAll(con.controllerList);
          for (var element in con.controllerList) {
            con.additionalControllerList
                .addAll(element.additionalController ?? []);
            if (con.controllerList.length == 1) {
              print("=================");
              con.additionalControllerList.add(AdditionalModel());
            }
          }
          print(con.controllerList[index].additionalController?.length);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: con.controllerList[index].nameController,
                        hintText: "Enter Name",
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                        onTap: () {
                          con.controllerList.removeAt(index);
                        },
                        child: const Icon(Icons.delete))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                con.controllerList[index].additionalController?.length == 0
                    ? Container(
                        color: AppColors.allGroupsText,
                        child: Text("EMpty"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const RangeMaintainingScrollPhysics(),
                        itemCount:
                            // con.additionalControllerList.length,
                            con.controllerList[index].additionalController
                                ?.length,
                        itemBuilder: (BuildContext context, int i) {
                          var item =
                              //  con.additionalControllerList[i];
                              con.controllerList[index]
                                  .additionalController?[i];
                          return Column(
                            children: [
                              AppTextField(
                                controller: item?.optionName,
                                hintText: "Option Name",
                                titleText: "Option Name",
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              AppTextField(
                                controller: item?.additionalPrice,
                                hintText: "Additional Price",
                                titleText: "Additional Price",
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              i != 0
                                  ? InkWell(
                                      onTap: () {
                                        con.controllerList[index]
                                            .additionalController
                                            // con.additionalControllerList
                                            ?.removeAt(i);
                                      },
                                      child: const Icon(Icons.delete))
                                  : SizedBox(),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          );
                        },
                      ),
                InkWell(
                  onTap: () {
                    // con.controllers
                    //     .add(TextEditingController());

                    con.controllerList[index].additionalController
                        // con.additionalControllerList
                        ?.add(AdditionalModel());
                  },
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColor,
                    size: 16.sp,
                  ),
                )
              ],
            ),
          );
        }));
  }
}
