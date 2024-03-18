import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/setting/components/update_passwprd_controller.dart';
import 'package:foodfestarestaurant/repositories/auth_repositories.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:foodfestarestaurant/res/app_text_field.dart';
import 'package:get/get.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final con = Get.put(UpdatePasswordController());

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
                        "Change Password",
                        style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                      ),
                      const Text("Aboutus", style: TextStyle(color: Colors.transparent)),
                    ],
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.1),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                              color: Theme.of(context).colorScheme.background,
                              boxShadow: AppStyle.boxShadow(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              AppTextField(
                                contentPadding: const EdgeInsets.all(12),
                                hintText: "Enter Old Password",
                                controller: con.oldPasswordCon,
                                errorMessage: con.oldPasswordError.value,
                                showError: con.oldPasswordValidation.value,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {},
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(16),
                                ],
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                              ),
                              SizedBox(height: 10.w),
                              AppTextField(
                                contentPadding: const EdgeInsets.all(12),
                                hintText: "Enter New Password",
                                controller: con.newPasswordCon,
                                errorMessage: con.newPasswordError.value,
                                showError: con.newPasswordValidation.value,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {},
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(16),
                                ],
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                              ),
                              SizedBox(height: 10.w),
                              AppTextField(
                                contentPadding: const EdgeInsets.all(12),
                                hintText: "Enter Password",
                                controller: con.cnfmNewPasswordCon,
                                errorMessage: con.cnfmNewPasswordError.value,
                                showError: con.cnfmNewPasswordValidation.value,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {},
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(16),
                                ],
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                              ),
                              SizedBox(height: 20.w),
                              Obx(
                                () => AppButton(
                                    loader: con.isLoading.value,
                                    height: 30.h,
                                    borderRadius: BorderRadius.circular(12.r),
                                    onPressed: () {
                                      //old password
                                      if (con.oldPasswordCon.value.text.length == 16) {
                                        con.oldPasswordError.value = "";
                                        con.oldPasswordValidation.value = false;
                                        FocusScope.of(context).unfocus();
                                      } else if (con.oldPasswordCon.value.text.length < 8) {
                                        con.oldPasswordValidation.value = true;
                                        con.oldPasswordError.value = "Please Enter your password at least 8 digits.";
                                      } else {
                                        con.oldPasswordValidation.value = false;
                                        con.oldPasswordError.value = "";
                                      }

                                      //new password
                                      if (con.newPasswordCon.value.text.length == 16) {
                                        con.newPasswordError.value = "";
                                        con.newPasswordValidation.value = false;
                                        FocusScope.of(context).unfocus();
                                      } else if (con.newPasswordCon.value.text.length < 8) {
                                        con.newPasswordValidation.value = true;
                                        con.newPasswordError.value = "Please Enter your password at least 8 digits.";
                                      } else {
                                        con.newPasswordValidation.value = false;
                                        con.newPasswordError.value = "";
                                      }

                                      //cnfm password
                                      // if (con.cnfmNewPasswordCon.value.text.length ==
                                      //     8) {
                                      //   con.cnfmNewPasswordError.value = "";
                                      //   FocusScope.of(context).unfocus();
                                      // } else
                                      if (con.cnfmNewPasswordCon.value.text.length < 16) {
                                        con.cnfmNewPasswordValidation.value = true;
                                        con.cnfmNewPasswordError.value = "Please Enter your password at least 8 digits.";
                                      } else if (con.cnfmNewPasswordCon.value.text != con.newPasswordCon.text) {
                                        con.cnfmNewPasswordValidation.value = true;
                                        con.cnfmNewPasswordError.value = "Confirm password not match.";
                                      } else {
                                        con.cnfmNewPasswordValidation.value = false;
                                        con.cnfmNewPasswordError.value = "";
                                      }

                                      if (con.oldPasswordValidation.isFalse &&
                                          con.newPasswordValidation.isFalse &&
                                          con.cnfmNewPasswordValidation.isFalse) {
                                        FocusScope.of(Get.context!).unfocus();
                                        AuthRepository().updatePasswordApiCall(
                                          isLoader: con.isLoading,
                                          params: {
                                            "old_password": con.oldPasswordCon.text,
                                            "password": con.newPasswordCon.text,
                                            "password_confirmation": con.cnfmNewPasswordCon.text
                                          },
                                        );
                                      }
                                    },
                                    title: "Update"),
                              ),
                            ],
                          ).paddingSymmetric(vertical: 10.h),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 15.h, vertical: 10.h),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
