import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/setting/components/business_management_schedule_controller.dart';
import 'package:foodfestarestaurant/repositories/account_repositories.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:get/get.dart';

class BusinessManagementScheduleScreen extends StatelessWidget {
  BusinessManagementScheduleScreen({super.key});

  final BusinessManagementScheduleController con = Get.put(BusinessManagementScheduleController());

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
                        "Restaurant Setup",
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
                      Obx(
                        () => con.isLoader.isTrue
                            ? const AppLoader()
                            : Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                width: Get.width,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                    color: Theme.of(context).colorScheme.background,
                                    boxShadow: AppStyle.boxShadow(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Restaurant Open & Close Time",
                                      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                    ),
                                    SizedBox(height: 5.h),
                                    _scheduleModule(),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AppButton(
                                            height: 32.h,
                                            buttonType: ButtonType.outline,
                                            borderWidth: 2,
                                            backgroundColor: Theme.of(context).colorScheme.background,
                                            borderColor: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(16.r),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              "Back",
                                              style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: AppButton(
                                            height: 32.h,
                                            buttonType: ButtonType.outline,
                                            borderWidth: 2,
                                            backgroundColor: Theme.of(context).primaryColor,
                                            borderColor: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(16.r),
                                            onPressed: () {
                                              AccountRepository().addRestaurantDetailSettingApiCall(isLoader: con.isLoader);
                                            },
                                            child: Text(
                                              "Save Change",
                                              style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 12.w, vertical: 10.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _scheduleModule() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            con.days[0].toUpperCase(),
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          Obx(() => mondaySchedule().paddingSymmetric(horizontal: 5.w, vertical: 5.h)),
          Text(
            con.days[1].toUpperCase(),
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          Obx(() => tuesdaySchedule().paddingSymmetric(horizontal: 5.w, vertical: 5.h)),
          Text(
            con.days[2].toUpperCase(),
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          Obx(() => wendesdaySchedule().paddingSymmetric(horizontal: 5.w, vertical: 5.h)),
          Text(
            con.days[3].toUpperCase(),
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          Obx(() => thursdaySchedule().paddingSymmetric(horizontal: 5.w, vertical: 5.h)),
          Text(
            con.days[4].toUpperCase(),
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          Obx(() => fridaySchedule().paddingSymmetric(horizontal: 5.w, vertical: 5.h)),
          Text(
            con.days[5].toUpperCase(),
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          Obx(() => saturdaySchedule().paddingSymmetric(horizontal: 5.w, vertical: 5.h)),
          Text(
            con.days[6].toUpperCase(),
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          Obx(() => sundaySchedule().paddingSymmetric(horizontal: 5.w, vertical: 5.h)),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     children: con.days.map((day) {
    //       return Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             '${day[0].toUpperCase()}${day.substring(1)}',
    //             style: TextStyle(
    //                 color: AppColors.black,
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 13.sp),
    //           ),
    //           SizedBox(height: 5.h),
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: Container(
    //                   padding: EdgeInsets.symmetric(horizontal: 10.w),
    //                   decoration: BoxDecoration(
    //                       color: AppColors.white,
    //                       borderRadius: BorderRadius.circular(8.r)),
    //                   child: DropdownButton<String>(
    //                     underline: Container(),
    //                     dropdownColor: AppColors.white,
    //                     style: TextStyle(
    //                         color: AppColors.black,
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: 12.sp),
    //                     isExpanded: true,
    //                     value: con.selectedOpening.value,
    //                     onChanged: (String? value) {
    //                       con.selectedOpening.value = value ?? "";
    //                     },
    //                     items: _buildDropdownItems(),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(width: 14.w),
    //               Expanded(
    //                 child: Container(
    //                   padding: EdgeInsets.symmetric(horizontal: 10.w),
    //                   decoration: BoxDecoration(
    //                       color: AppColors.white,
    //                       borderRadius: BorderRadius.circular(8.r)),
    //                   child: DropdownButton<String>(
    //                     style: TextStyle(
    //                         color: AppColors.black,
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: 12.sp),
    //                     underline: Container(),
    //                     isExpanded: true,
    //                     value: con.selectedClosing.value,
    //                     onChanged: (String? value) {
    //                       con.selectedClosing.value = value ?? "";
    //                     },
    //                     items: _buildDropdownItems(),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ).paddingSymmetric(horizontal: 5.w, vertical: 5.h),
    //         ],
    //       );
    //     }).toList(),
    //   ),
    // );
  }

  Widget mondaySchedule() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: AppColors.white,
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              isExpanded: true,
              value: con.selectedMondayOpening.value,
              onChanged: (String? value) {
                con.selectedMondayOpening.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              underline: Container(),
              isExpanded: true,
              value: con.selectedMondayClosing.value,
              onChanged: (String? value) {
                con.selectedMondayClosing.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget tuesdaySchedule() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: AppColors.white,
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              isExpanded: true,
              value: con.selectedTuesdayOpening.value,
              onChanged: (String? value) {
                con.selectedTuesdayOpening.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              underline: Container(),
              isExpanded: true,
              value: con.selectedTuesdayClosing.value,
              onChanged: (String? value) {
                con.selectedTuesdayClosing.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget wendesdaySchedule() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: AppColors.white,
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              isExpanded: true,
              value: con.selectedWendesdayOpening.value,
              onChanged: (String? value) {
                con.selectedWendesdayOpening.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              underline: Container(),
              isExpanded: true,
              value: con.selectedWendesdayClosing.value,
              onChanged: (String? value) {
                con.selectedWendesdayClosing.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget thursdaySchedule() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: AppColors.white,
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              isExpanded: true,
              value: con.selectedThursdayOpening.value,
              onChanged: (String? value) {
                con.selectedThursdayOpening.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              underline: Container(),
              isExpanded: true,
              value: con.selectedThursdayClosing.value,
              onChanged: (String? value) {
                con.selectedThursdayClosing.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget fridaySchedule() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: AppColors.white,
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              isExpanded: true,
              value: con.selectedFridayOpening.value,
              onChanged: (String? value) {
                con.selectedFridayOpening.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              underline: Container(),
              isExpanded: true,
              value: con.selectedFridayClosing.value,
              onChanged: (String? value) {
                con.selectedFridayClosing.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget saturdaySchedule() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: AppColors.white,
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              isExpanded: true,
              value: con.selectedSaturdayOpening.value,
              onChanged: (String? value) {
                con.selectedSaturdayOpening.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              underline: Container(),
              isExpanded: true,
              value: con.selectedSaturdayClosing.value,
              onChanged: (String? value) {
                con.selectedSaturdayClosing.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget sundaySchedule() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: AppColors.white,
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              isExpanded: true,
              value: con.selectedSundayOpening.value,
              onChanged: (String? value) {
                con.selectedSundayOpening.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
            child: DropdownButton<String>(
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),
              underline: Container(),
              isExpanded: true,
              value: con.selectedSundayClosing.value,
              onChanged: (String? value) {
                con.selectedSundayClosing.value = value ?? "";
              },
              items: con.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      value: e["value"],
                      child: Text(
                        e["text"],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
