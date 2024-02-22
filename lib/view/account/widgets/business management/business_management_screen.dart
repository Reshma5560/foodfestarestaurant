import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/account/components/business_mangement_controller.dart';
import 'package:foodfestarestaurant/res/app_appbar.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:foodfestarestaurant/res/app_text_field.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:get/get.dart';

class BusinessManagementScreen extends StatelessWidget {
  BusinessManagementScreen({super.key});

  final BusinessManagementController con =
      Get.put(BusinessManagementController());
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
                child: ListView(padding: EdgeInsets.zero, children: [
                  CommonAppBar(
                    title: "Restaurant Setup",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        color: Theme.of(context).colorScheme.background,
                        boxShadow: AppStyle.boxShadow(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Obx(() => con.isLoader.isTrue
                        ? const AppLoader()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Row(
                                  children: [
                                    const Icon(Icons.settings),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "Close Restaurant Temporarily ",
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp),
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Obx(() => Switch(
                                            value: con.selectCloseRes.value,
                                            onChanged: (bool value1) {
                                              con.selectCloseRes.value = value1;
                                            },
                                          )),
                                    )
                                  ],
                                ),
                                Text(
                                  "General Setting",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                _generalSettingModule(),
                                SizedBox(
                                  height: 17.h,
                                ),
                                Text(
                                  "Basic Setting",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                _basicSettingModule(),
                                SizedBox(
                                  height: 17.h,
                                ),
                                Text(
                                  "Restaurant Meta Data",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                _restaurantMetaDataodule(),
                                SizedBox(
                                  height: 17.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: AppButton(
                                    height: 30.h,
                                    width: Get.width / 2,
                                    onPressed: () {
                                      Get.toNamed(AppRoutes
                                          .businessManagementScheduleScreen);
                                    },
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ])),
                  ).paddingSymmetric(horizontal: 12.w, vertical: 10.h),
                ]),
              );
            }));
  }

  Widget _generalSettingModule() {
    return Column(
      children: [
        SizedBox(
          height: 7.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Scheduled Delivery",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp),
              ),
              Transform.scale(
                scale: 0.6,
                child: Obx(() => Switch(
                      value: con.selectSchedule.value,
                      onChanged: (bool value1) {
                        con.selectSchedule.value = value1;
                      },
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Home Delivery",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp),
              ),
              Transform.scale(
                scale: 0.6,
                child: Obx(() => Switch(
                      value: con.selectHome.value,
                      onChanged: (bool value1) {
                        con.selectHome.value = value1;
                      },
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Takeaway",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp),
              ),
              Transform.scale(
                scale: 0.6,
                child: Obx(() => Switch(
                      value: con.selectTakeaway.value,
                      onChanged: (bool value1) {
                        con.selectTakeaway.value = value1;
                      },
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Veg",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp),
              ),
              Transform.scale(
                scale: 0.6,
                child: Obx(() => Switch(
                      value: con.selectVeg.value,
                      onChanged: (bool value1) {
                        con.selectVeg.value = value1;
                      },
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Non Veg",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp),
              ),
              Transform.scale(
                scale: 0.6,
                child: Obx(() => Switch(
                      value: con.selectNonVeg.value,
                      onChanged: (bool value1) {
                        con.selectNonVeg.value = value1;
                      },
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cutlery",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp),
              ),
              Transform.scale(
                scale: 0.6,
                child: Obx(() => Switch(
                      value: con.selectCutlery.value,
                      onChanged: (bool value1) {
                        con.selectCutlery.value = value1;
                      },
                    )),
              )
            ],
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 12.w);
  }

  Widget _basicSettingModule() {
    return Column(
      children: [
        SizedBox(
            height: 35.h,
            child: AppTextField(
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(defaultRadius)),
                  borderSide: BorderSide(color: AppColors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(defaultRadius)),
                  borderSide: BorderSide(color: AppColors.white)),
              hintText: "Enter Minimum Order Amount",
              hintStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintColor),
              controller: con.minimunQtyAmountCon.value,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            )),
        SizedBox(
          height: 7.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: SizedBox(
                    height: 35.h,
                    child: AppTextField(
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(defaultRadius)),
                          borderSide: BorderSide(color: AppColors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(defaultRadius)),
                          borderSide: BorderSide(color: AppColors.white)),
                      hintText: "Enter Gst",
                      hintStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.hintColor),
                      controller: con.gstCon.value,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ))),
            SizedBox(
              width: 7.w,
            ),
            Expanded(
                child: SizedBox(
                    height: 35.h,
                    child: AppTextField(
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(defaultRadius)),
                          borderSide: BorderSide(color: AppColors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(defaultRadius)),
                          borderSide: BorderSide(color: AppColors.white)),
                      hintText: "Enter Tags (Ex: tag1, tag2, tag3)",
                      hintStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.hintColor),
                      controller: con.tagCon.value,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ))),
          ],
        ),
        SizedBox(
          height: 7.h,
        ),
        InkWell(
          onTap: () {
            getCuisinecheckList();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Cuisine",
                style: TextStyle(
                  // fontFamily: FontFamilyText.sFProDisplayRegular,
                  color: Theme.of(Get.context!).primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.arrow_downward)
            ],
          ),
        ),

        SizedBox(
          height: 7.h,
        ),

        con.selectedChoice.isNotEmpty
            ? Wrap(
                children: con.getCuisineListData.map((e) {
                return con.selectedChoice.contains(e.id)
                    ? Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 3.h),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Theme.of(Get.context!).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(10.r)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        child: Text(
                          e.cuisineName ?? "",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(Get.context!).primaryColor),
                        ),
                      )
                    : const SizedBox();
              }).toList())
            : Container()
        // AppTextField(
        //   hintText: "Enter Cuisine",
        //   hintStyle: TextStyle(
        //       fontSize: 12.sp,
        //       fontWeight: FontWeight.w400,
        //       color: AppColors.hintColor),
        //   controller: con.cuisineCon.value,
        //   errorMessage: con.cuisineError.value,
        //   showError: con.cuisineValidation.value,
        //   keyboardType: TextInputType.name,
        //   textInputAction: TextInputAction.next,
        //   suffixOnTap: () {
        //     getCuisinecheckList();
        //   },
        //   suffixIcon: const Icon(Icons.arrow_downward),
        //   onChanged: (value) {
        //     con.cuisineValidation.value = false;
        //   },
        // ),
      ],
    ).paddingSymmetric(horizontal: 12.w);
  }

  getCuisinecheckList() {
    return Get.dialog(
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    type: MaterialType.canvas,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Select Cuisine",
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
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          Theme.of(Get.context!).primaryColor),
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                            Wrap(
                              children: _buildChoiceList(),
                            ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
      // barrierDismissible: false
    );
  }

  _buildChoiceList() {
    List<Widget> choices = <Widget>[];
    for (var item in con.getCuisineListData) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: Theme.of(Get.context!).primaryColor,
          label: Text(item.cuisineName ?? ""),
          selected: con.selectedChoice.contains(item.id),
          //  == item.id,
          onSelected: (selected) {
            con.selectedChoice.contains(item.id)
                ? con.selectedChoice.remove(item.id)
                : con.selectedChoice.add(item.id ?? "");
          },
        ),
      ));
    }
    return choices;
  }

  Widget _restaurantMetaDataodule() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _imageModule(),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
          height: 35.h,
          child: AppTextField(
            enabled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(defaultRadius)),
                borderSide: BorderSide(color: AppColors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(defaultRadius)),
                borderSide: BorderSide(color: AppColors.white)),
            hintText: "Enter Meta Title",
            hintStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.hintColor),
            controller: con.metatTitleCon.value,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
            height: 70.h,
            child: AppTextField(
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(defaultRadius)),
                  borderSide: BorderSide(color: AppColors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(defaultRadius)),
                  borderSide: BorderSide(color: AppColors.white)),
              maxLines: 2,
              hintText: "Enter Short Description",
              hintStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintColor),
              controller: con.metaDescCon.value,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ))
      ],
    ).paddingSymmetric(horizontal: 12.w);
  }

  Widget _imageModule() {
    return InkWell(
      onTap: () {
        con.showImagePickerBottomSheet();
      },
      child: SizedBox(
        // margin: EdgeInsets.symmetric(horizontal: .w),
        height: 100,
        width: 120,
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
                          Icon(
                            Icons.camera_enhance,
                            size: 24,
                            color: AppColors.greyFontColor,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Add logo/Add \nRestaurant Photo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.greyFontColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9),
                          )
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}

// class MultiSelectChip extends StatefulWidget {
//   final List<String> reportList;
//   MultiSelectChip(this.reportList);
//   @override
//   _MultiSelectChipState createState() => _MultiSelectChipState();
// }

// class _MultiSelectChipState extends State<MultiSelectChip> {
//   String selectedChoice = "";
//   // this function will build and return the choice list
//   _buildChoiceList() {
//     List<Widget> choices = List();
//     widget.reportList.forEach((item) {
//       choices.add(Container(
//         padding: const EdgeInsets.all(2.0),
//         child: ChoiceChip(
//           label: Text(item),
//           selected: selectedChoice == item,
//           onSelected: (selected) {
//             setState(() {
//               selectedChoice = item;
//             });
//           },
//         ),
//       ));
//     });
//     return choices;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: _buildChoiceList(),
//     );
//   }
// }
