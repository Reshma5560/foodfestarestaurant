// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/common_widgets/simmer_tile.dart';
import 'package:foodfestarestaurant/controller/setting/components/addons/addons_controller.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:foodfestarestaurant/res/app_assets.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_strings.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:foodfestarestaurant/res/app_text_field.dart';
import 'package:foodfestarestaurant/res/widgets/empty_element.dart';
import 'package:get/get.dart';

class AddonsScreen extends StatelessWidget {
  AddonsScreen({super.key});

  final AddonsController con = Get.put(AddonsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        onPressed: () {
          con.isAdd.value = true;
          _customAddAddonsdialog();
        },
        child: const Icon(Icons.add),
      ),
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        tween: Tween(begin: 20.0, end: 1.0),
        builder: (context, value, child) {
          return AnimatedOpacity(
            opacity: value == 20 ? 0 : 1,
            duration: const Duration(milliseconds: 700),
            child: Stack(
              children: [
                Image.asset("assets/images/bg_home_image.png", width: Get.width, fit: BoxFit.fill),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 16.sp,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Text(
                        "Addon",
                        style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                      ),
                      const Text("Aboutus", style: TextStyle(color: Colors.transparent)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.1),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await DesktopRepository().getAddonsListAPI(isLoader: con.isLoading, isInitial: true);
                    },
                    child: Obx(
                      () => con.isLoading.isTrue
                          ? ListView.builder(
                              padding: const EdgeInsets.all(defaultPadding).copyWith(bottom: MediaQuery.of(Get.context!).padding.bottom),
                              shrinkWrap: true,
                              itemCount: 8,
                              itemBuilder: (BuildContext context, index) => const SimmerTile(),
                            )
                          : con.getAddonsDataList.isEmpty
                              ? EmptyElement(
                                  imagePath: AppAssets.noData,
                                  height: Get.height / 1.8,
                                  imageHeight: Get.width / 2.4,
                                  imageWidth: Get.width / 2,
                                  spacing: 0,
                                  title: AppStrings.recordNotFound,
                                  subtitle: "",
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: con.getAddonsDataList.length,
                                  // .getAddonsDataModel.value.data?.data?.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var item = con.getAddonsDataList[index];
                                    RxBool selectStatus = false.obs;
                                    selectStatus.value = item.isActive == 0 ? false : true;
                                    return Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                      // padding: const EdgeInsets.symmetric(),
                                      // margin: EdgeInsets.symmetric(
                                      //     vertical: 5.h, horizontal: 15.w),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Theme.of(context).colorScheme.background,
                                          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                          boxShadow: AppStyle.boxShadow()),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Image.network(
                                          //   item?.image ?? "",
                                          //   height: 100.h,
                                          //   width: 100.w,
                                          //   fit: BoxFit.cover,
                                          // ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              item.addonName ?? "",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              " ₹ ${(item.price ?? "")}",
                                              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14.sp, fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Transform.scale(
                                              scale: 0.6,
                                              child: Obx(() => Switch(
                                                    value: selectStatus.value,
                                                    onChanged: (bool value1) {
                                                      selectStatus.value = value1;
                                                      var tempIsActive;
                                                      if (selectStatus.value == true) {
                                                        tempIsActive = 1;
                                                      } else {
                                                        tempIsActive = 0;
                                                      }

                                                      var params = {"is_active": tempIsActive};

                                                      DesktopRepository()
                                                          .updateAddonsStatusApiCall(item.id.toString(), isLoader: con.isLoading, params: params);
                                                    },
                                                  )),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    con.isAdd.value = false;
                                                    _customAddAddonsdialog(name: item.addonName, price: item.price, addonId: item.id);
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(5),
                                                    decoration:
                                                        BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).primaryColor),
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 13.sp,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _deleteWidget(item.id ?? "");
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Theme.of(context).primaryColor.withOpacity(0.3)),
                                                    child: Icon(
                                                      Icons.delete,
                                                      size: 13.sp,
                                                      color: Theme.of(context).primaryColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ).paddingSymmetric(horizontal: 10.w, vertical: 2.h),
                                    );
                                  },
                                ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _deleteWidget(String id) {
    return Get.dialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).colorScheme.background,
                  border: Border.all(width: 3, color: Theme.of(Get.context!).primaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    color: Theme.of(Get.context!).colorScheme.background,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const SizedBox(height: 10),
                      Text(
                        "Delete",
                        style: TextStyle(
                          // fontFamily: FontFamilyText.sFProDisplayRegular,
                          color: Theme.of(Get.context!).primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Are you sure you want delete food ?",
                        style: TextStyle(
                          // fontFamily: FontFamilyText.sFProDisplayRegular,
                          color: Theme.of(Get.context!).primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              height: 30.h,
                              borderRadius: BorderRadius.circular(10),
                              onPressed: () async {
                                DesktopRepository().deleteAddonsApiCall(
                                  id.toString(),
                                );
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: AppButton(
                              height: 30.h,
                              borderRadius: BorderRadius.circular(10),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "No",
                                style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
        barrierDismissible: false);
  }

  _customAddAddonsdialog({String? name, int? price, String? addonId}) {
    if (name != null && price != null) {
      con.nameCon.value.text = name;
      con.priceCon.value.text = price.toDouble().toString();
    } else {
      con.nameCon.value.clear();
      con.priceCon.value.clear();
    }
    return Get.dialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).colorScheme.background,
                  border: Border.all(width: 3, color: Theme.of(Get.context!).primaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    color: Theme.of(Get.context!).colorScheme.background,
                    child: Obx(
                      () => Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                name == null && price == null ? "Create Addon" : "Edit Addon",
                                style: TextStyle(
                                  // fontFamily: FontFamilyText.sFProDisplayRegular,
                                  color: Theme.of(Get.context!).primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  con.priceValidation.value = false;
                                  con.nameValidation.value = false;
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(Get.context!).primaryColor),
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          AppTextField(
                            contentPadding: const EdgeInsets.all(12),
                            enabledBorder:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide(color: AppColors.white)),
                            controller: con.nameCon.value,
                            // titleText: "Name*",
                            errorMessage: con.nameError.value,
                            showError: con.nameValidation.value,
                            hintText: "Item Name",
                            hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.hintColor),
                            onChanged: (value) {
                              con.nameValidation.value = false;
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppTextField(
                            contentPadding: const EdgeInsets.all(12),
                            controller: con.priceCon.value,
                            // titleText: "Price*",
                            enabledBorder:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide(color: AppColors.white)),

                            hintText: "Item Price",
                            hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.hintColor),
                            errorMessage: con.priceError.value,
                            showError: con.priceValidation.value,
                            onChanged: (value) {
                              con.priceValidation.value = false;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Obx(
                            () => AppButton(
                              loader: con.isLoadingAdd.value,
                              height: 35.h,
                              borderRadius: BorderRadius.circular(10),
                              onPressed: () {
                                /// name validation
                                if (con.nameCon.value.text.trim().isEmpty) {
                                  con.nameValidation.value = true;
                                  con.nameError.value = "Please enter your addon name.";
                                } else {
                                  con.nameValidation.value = false;
                                }

                                ///price validation

                                if (con.priceCon.value.text.isEmpty) {
                                  con.priceValidation.value = true;
                                  con.priceError.value = "Please Enter your price.";
                                } else {
                                  con.priceValidation.value = false;
                                  con.priceError.value = "";
                                }

                                if (con.nameValidation.isFalse && con.priceValidation.isFalse) {
                                  var params = {"addon_name": con.nameCon.value.text.trim(), "price": con.priceCon.value.text.trim()};
                                  if (name != null && price != null) {
                                    DesktopRepository().updateAddonsApiCall(addonId ?? "", isLoader: con.isLoading, params: params);
                                  } else {
                                    DesktopRepository().addAddonsApiCall(isLoader: con.isLoading, params: params);
                                  }
                                }
                              },
                              child: Text(
                                name == null && price == null ? "ADD" : "EDIT",
                                style: TextStyle(color: AppColors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        barrierDismissible: false);
  }
}
