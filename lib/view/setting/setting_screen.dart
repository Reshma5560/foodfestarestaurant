import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/common_widgets/custom_list_tile.dart';
import 'package:foodfestarestaurant/controller/setting/setting_controller.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:foodfestarestaurant/utils/local_storage.dart';
import 'package:get/get.dart';

import '../../res/app_style.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final con = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/bg_home_image.png", width: Get.width, fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 16.sp, color: Colors.transparent),
                  onPressed: () {
                    // Get.back();
                  },
                ),
                Text(
                  "Setting",
                  style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                ),
                const Text("Aboutus", style: TextStyle(color: Colors.transparent)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                CustomListTile(
                  icon: Icons.food_bank,
                  title: 'Business Management',
                  onPressed: () {
                    Get.back();
                    Get.toNamed(AppRoutes.businessManagementScreen);
                  },
                ),
                SizedBox(
                  height: 13.h,
                ),
                CustomListTile(
                  icon: Icons.person,
                  title: 'Deliveryman',
                  onPressed: () {
                    Get.toNamed(AppRoutes.displayDeliveryManScreen);
                  },
                ),
                SizedBox(
                  height: 13.h,
                ),
                CustomListTile(
                  icon: Icons.person,
                  title: 'Customer',
                  onPressed: () {
                    Get.toNamed(AppRoutes.displayCustomerScreen);
                  },
                ),
                SizedBox(
                  height: 13.h,
                ),
                CustomListTile(
                  icon: Icons.fastfood,
                  title: 'Food',
                  onPressed: () {
                    Get.back();
                    Get.toNamed(AppRoutes.foodScreen);
                  },
                ),
                SizedBox(
                  height: 13.h,
                ),
                CustomListTile(
                  icon: Icons.food_bank,
                  title: 'Addons',
                  onPressed: () {
                    Get.back();
                    Get.toNamed(AppRoutes.addonsScreen);
                  },
                ),
                SizedBox(
                  height: 13.h,
                ),
                CustomListTile(
                  icon: Icons.money,
                  title: 'My Earning',
                  onPressed: () {
                    Get.toNamed(AppRoutes.myEarningScreen);
                  },
                ),
                SizedBox(
                  height: 13.h,
                ),
                CustomListTile(
                  icon: Icons.password,
                  title: 'Change password',
                  onPressed: () {
                    Get.toNamed(AppRoutes.updatePasswordScreen);
                  },
                ),
                SizedBox(
                  height: 13.h,
                ),
                CustomListTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  onPressed: () {
                    _logoutWidget();
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 10.w),
          ),
        ],
      ),
    );
  }

  // _logoutWidget() {
  //   return showDialog(
  //     barrierDismissible: false,
  //     context: Get.context!,
  //     builder: (context) {
  //       return CustomLogoutAlertDialog(
  //         text: "Logout",
  //         content: "Are you sure you want logout ?",
  //         yesButtonText: "Yes",
  //         onYesPressed: () {
  //           con.isLoader.value = true;

  //           LocalStorage.clearLocalStorage().then((value) {
  //             Get.offAllNamed(AppRoutes.loginScreen);
  //           });
  //         },
  //         //  () async => await DesktopRepository()
  //         //     .logOutApiCall(isLoader: con.isLoader),
  //         noButtonText: "No",
  //         onNoPressed: () => Get.back(),
  //         bgColor: Theme.of(context).primaryColor,
  //       );
  //     },
  //   );
  // }
  _logoutWidget() {
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
                        "Logout",
                        style: TextStyle(
                          // fontFamily: FontFamilyText.sFProDisplayRegular,
                          color: Theme.of(Get.context!).primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Are you sure you want logout ?",
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
                              onPressed: () {
                                con.isLoader.value = true;

                                LocalStorage.clearLocalStorage().then((value) {
                                  Get.offAllNamed(AppRoutes.loginScreen);
                                });
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
