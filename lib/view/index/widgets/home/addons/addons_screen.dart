import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/home/components/addons/addons_controller.dart';
import 'package:foodfestarestaurant/res/app_appbar.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_text_field.dart';
// import 'package:foodfestarestaurant/view/index/widgets/home/addons/widgets/custom_add_addons_dialog.dart';
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
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          onPressed: () {
            Get.dialog(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Material(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),

                                Text(
                                  "Create Addon",
                                  style: TextStyle(
                                    // fontFamily: FontFamilyText.sFProDisplayRegular,
                                    color: AppColors.blackColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Divider(
                                  color: AppColors.greyBorderColor,
                                ),
                                AppTextField(
                                  controller: con.nameCon.value,
                                  titleText: "Name*",
                                  errorMessage: con.nameError.value,
                                  showError: con.nameValidation.value,
                                  hintText: "Name",
                                  onChanged: (value) {
                                    con.nameValidation.value = false;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                AppTextField(
                                  controller: con.priceCon.value,
                                  titleText: "Price*",
                                  hintText: "Price",
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          /// name validation
                                          if (con.nameCon.value.text
                                              .trim()
                                              .isEmpty) {
                                            con.nameValidation.value = true;
                                            con.nameError.value =
                                                "Please enter your addon name.";
                                          } else {
                                            con.nameValidation.value = false;
                                          }

                                          ///price validation

                                          if (con.priceCon.value.text.isEmpty) {
                                            con.priceValidation.value = true;
                                            con.priceError.value =
                                                "Please Enter your price.";
                                          } else {
                                            con.priceValidation.value = false;
                                            con.priceError.value = "";
                                          }
                                        },
                                        child: Text("Save")),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Cancel"))
                                  ],
                                )
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: AppButton(
                                //         child: Text("Save"),
                                //         // text: yesButtonText,
                                //         // onTap: onYesPressed,
                                //         // fontWeight: FontWeight.bold,
                                //         // textsize: 13.sp,
                                //         // textColor: AppColors.white,
                                //         // backgroundColor: bgColor,
                                //         onPressed: () {},
                                //       ),
                                //     ),
                                //     const SizedBox(width: 15),
                                //     Expanded(
                                //       child: AppButton(
                                //         child: Text("Cancel"),
                                //         // text: noButtonText,
                                //         // onTap: onNoPressed,
                                //         // fontWeight: FontWeight.bold,
                                //         // textsize: 13.sp,
                                //         // textColor: AppColors.white,
                                //         // backgroundColor: bgColor,
                                //         onPressed: () {
                                //           Get.back();
                                //         },
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          // => Dialog(
          //     child: CustomAddAddonsDialog(
          //   text: "Create Addon",
          //   // yesButtonText: "Save",
          //   // noButtonText: "Cancel",
          //   // onNoPressed: () => Get.back(),
          //   bgColor: Theme.of(context).colorScheme.background,
          // )
          //     // barrierDismissible: false,
          //     // context: context,
          //     // builder: (BuildContext context) {
          //     //   return
          //     // },
          //     ),
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
                  child: Column(children: [
                    CommonAppBar(
                      title: "Food",
                      isLeadingShow: false,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                        child: Obx(
                      () => con.isLoading.isTrue
                          ? const AppLoader()
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount:
                                  con.getAddonsDataModel.value.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item =
                                    con.getAddonsDataModel.value.data?[index];
                                return InkWell(
                                  onTap: () {
                                    // Get.toNamed(AppRoutes.foodDetailsScreen,
                                    //     arguments: {'foodId': item?.id});
                                  },
                                  child: Row(
                                    children: [
                                      // Image.network(
                                      //   item?.image ?? "",
                                      //   height: 100.h,
                                      //   width: 100.w,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item?.addonName ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "₹${(item?.price ?? "")}",
                                            style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 18.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Icon(
                                                Icons.delete,
                                                size: 18.sp,
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: 15.w, vertical: 5.h),
                                );
                              },
                            ),
                    ))
                  ]));
            }));
  }
}
