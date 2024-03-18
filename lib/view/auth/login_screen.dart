import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/res/app_assets.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';
import '../../repositories/auth_repositories.dart';
import '../../res/app_button.dart';
import '../../res/app_style.dart';
import '../../res/app_text_field.dart';
import '../../utils/helper.dart';
import '../gradient_container/gradient_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: GradientContainer(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: Get.height,
                child: Image.asset(
                  AppAssets.bgImage,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: Get.height * 0.55,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(width: 13.w, color: Theme.of(context).primaryColor.withOpacity(0.2))),
                child: TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOutCubic,
                  tween: Tween(begin: 20.0, end: 1.0),
                  builder: (context, value, child) {
                    return AnimatedOpacity(
                      opacity: value == 20 ? 0 : 1,
                      duration: const Duration(milliseconds: 700),
                      child: Obx(
                        () => ListView(
                          padding: EdgeInsets.all(defaultPadding.w),
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          physics: const RangeMaintainingScrollPhysics(),
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(AppAssets.bgLogo),
                                Text(
                                  "Log In",
                                  style: AppStyle.loginTitleStyle(),
                                ),
                              ],
                            ),
                            SizedBox(height: defaultPadding.h),
                            AppTextField(
                              hintText: "Enter Email",
                              controller: con.emailCon.value,
                              errorMessage: con.emailError.value,
                              showError: con.emailValidation.value,
                              keyboardType: TextInputType.emailAddress,
                              contentPadding: const EdgeInsets.all(14),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                              onChanged: (value) {
                                con.emailValidation.value = false;
                              },
                            ),
                            SizedBox(height: 10.h),
                            AppTextField(
                              // titleText: "Password",
                              contentPadding: const EdgeInsets.all(14),
                              hintText: "Enter Password",
                              controller: con.passwordCon.value,
                              errorMessage: con.passwordError.value,
                              showError: con.passwordValidation.value,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: con.passwordVisible.value,
                              textInputAction: TextInputAction.done,
                              suffixOnTap: () {
                                con.passwordVisible.value = !con.passwordVisible.value;
                              },
                              suffixIcon: Icon(con.passwordVisible.value ? Icons.visibility : Icons.visibility_off,
                                  size: 15.sp, color: AppColors.iconGreyColor
                                  //Theme.of(context).primaryColor,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14.r)), borderSide: BorderSide(color: AppColors.white)),

                              onChanged: (value) {
                                // if (con.passwordCon.value.text.length ==
                                //     16) {
                                //   con.passwordError.value = "";
                                //   con.passwordValidation.value = false;
                                //   FocusScope.of(context).unfocus();
                                // } else if (con
                                //         .passwordCon.value.text.length <
                                //     8) {
                                //   con.passwordValidation.value = true;
                                //   con.passwordError.value =
                                //       "Please Enter your password at least 8 digits.";
                                // } else {
                                con.passwordValidation.value = false;
                                //   con.passwordError.value = "";
                                // }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(16),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: con.isRemeber.value,
                                  onChanged: (value) {
                                    con.isRemeber.value = !con.isRemeber.value;
                                  },
                                  checkColor: AppColors.white,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      con.isRemeber.value = !con.isRemeber.value;
                                    },
                                    child: Text(
                                      "Remember Me!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        decorationThickness: 1.5,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.forgotPasswordScreen);
                                  },
                                  child: Text(
                                    "Forgot password",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1.5,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                            SizedBox(height: MediaQuery.of(context).viewInsets.bottom + defaultPadding.w),
                            Obx(
                              () => TweenAnimationBuilder(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.elasticOut,
                                tween: con.buttonPress.value ? Tween(begin: 0.9, end: 0.97) : Tween(begin: 1.0, end: 1.0),
                                builder: (context, value, child) {
                                  return Transform.scale(
                                    scale: value,
                                    child: Obx(
                                      () => AppButton(
                                        height: 30.h,
                                        borderRadius: BorderRadius.circular(12.r),
                                        title: "Continue",
                                        loader: con.isLoading.value,
                                        onHighlightChanged: (press) {
                                          con.buttonPress.value = press;
                                        },
                                        onPressed: () {
                                          if (con.isLoading.isFalse) {
                                            /// Email validation
                                            if (con.emailCon.value.text.trim().isEmpty) {
                                              con.emailValidation.value = true;
                                              con.emailError.value = "Please enter your email address.";
                                            } else if (Helper.isEmail(con.emailCon.value.text.trim()) != true) {
                                              con.emailValidation.value = true;
                                              con.emailError.value = "Please enter valid email address.";
                                            } else {
                                              con.emailValidation.value = false;
                                            }

                                            ///password validation

                                            if (con.passwordCon.value.text.isEmpty) {
                                              con.passwordValidation.value = true;
                                              con.passwordError.value = "Please Enter your password.";
                                            } else if (con.passwordCon.value.text.length < 8) {
                                              con.passwordValidation.value = true;
                                              con.passwordError.value = "Please Enter your password at least 8 digits.";
                                            } else {
                                              con.passwordValidation.value = false;
                                              con.passwordError.value = "";
                                            }

                                            if (con.emailValidation.isFalse) {
                                              FocusScope.of(context).unfocus();
                                              AuthRepository().loginApi(
                                                isLoader: con.isLoading,
                                                params: {
                                                  "email": con.emailCon.value.text.trim(),
                                                  "password": con.passwordCon.value.text.trim(),
                                                },
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 10.w, vertical: 15.h),
                      ),
                    );
                  },
                ),
              ).paddingSymmetric(horizontal: 10.w),
              // UiUtils.scrollGradient(context),
            ],
          ),
        ),
      ),
    );
  }
}
