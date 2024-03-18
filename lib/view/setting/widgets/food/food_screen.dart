// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/setting/components/food/food_controller.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:foodfestarestaurant/res/app_assets.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_strings.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:foodfestarestaurant/res/widgets/empty_element.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:get/get.dart';

class FoodScreen extends StatelessWidget {
  FoodScreen({super.key});

  final FoodController con = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        onPressed: () {
          Get.toNamed(AppRoutes.addFoodScreen);
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
                        "Food",
                        style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                      ),
                      const Text("Aboutus", style: TextStyle(color: Colors.transparent)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.1),
                  child: Obx(
                    () => con.isLoading.isTrue
                        ? const AppLoader()
                        : con.getOrderDataList.isEmpty
                            ? RefreshIndicator(
                                onRefresh: () async {
                                  await DesktopRepository().getFoodListAPI(isLoader: con.isLoading, isInitial: true);
                                },
                                child: ListView(
                                  children: [
                                    EmptyElement(
                                      imagePath: AppAssets.noData,
                                      height: Get.height / 1.8,
                                      imageHeight: Get.width / 2.4,
                                      imageWidth: Get.width / 2,
                                      spacing: 0,
                                      title: AppStrings.recordNotFound,
                                      subtitle: "",
                                    ),
                                  ],
                                ),
                              )
                            : RefreshIndicator(
                                onRefresh: () async {
                                  await DesktopRepository().getFoodListAPI(isLoader: con.isLoading, isInitial: true);
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                                  // gridDelegate:
                                  //     const SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 2,
                                  //         mainAxisExtent: 180),
                                  itemCount: con.getOrderDataList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var item = con.getOrderDataList[index];
                                    RxBool selectStatus = false.obs;
                                    selectStatus.value = item.isActive == 0 ? false : true;
                                    return Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                        boxShadow: AppStyle.boxShadow(),
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(50.r),
                                                      child: Image.network(
                                                        item.image ?? "",
                                                        height: 50.h,
                                                        width: 60.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      item.foodName ?? "",
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          item.category?.categoryName ?? "",
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600),
                                                        ),
                                                        Transform.scale(
                                                          scale: 0.7,
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

                                                                  DesktopRepository().updateFoodStatusApiCall(item.id.toString(),
                                                                      isLoader: con.isLoading, params: params);
                                                                },
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "₹${(item.price ?? "")}",
                                                      style: TextStyle(color: AppColors.black, fontSize: 12.sp, fontWeight: FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            item.veg == 1 ? "Veg" : "Non Veg",
                                                            style: TextStyle(color: AppColors.black, fontSize: 11.sp, fontWeight: FontWeight.w500),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Get.toNamed(
                                                                  AppRoutes.addFoodScreen,
                                                                  arguments: {"isEdit": true, "foodId": item.id},
                                                                );
                                                              },
                                                              child: Container(
                                                                padding: const EdgeInsets.all(5),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(8), color: Theme.of(context).primaryColor),
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
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 13.h,
                                          ),
                                        ],
                                      ).paddingSymmetric(vertical: 5.h),
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

  // _deleteWidget(String? id) {
  //   return showDialog(
  //     barrierDismissible: false,
  //     context: Get.context!,
  //     builder: (context) {
  //       return CustomLogoutAlertDialog(
  //         text: "Delete",
  //         content: "Are you sure you want delete food ?",
  //         yesButtonText: "Yes",
  //         onYesPressed: () async {
  //           con.isLoading.value = true;
  //           await DesktopRepository()
  //               .deleteFoodApiCall(foodId: id ?? "", isLoader: con.isLoading);
  //         },
  //         //  () async => await DesktopRepository()
  //         //     .logOutApiCall(isLoader: profileController.isLoader),
  //         noButtonText: "No",
  //         onNoPressed: () => Get.back(),
  //         bgColor: Theme.of(context).primaryColor,
  //       );
  //     },
  //   );
  // }

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
                                con.isLoading.value = true;
                                await DesktopRepository().deleteFoodApiCall(foodId: id, isLoader: con.isLoading);
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
}
