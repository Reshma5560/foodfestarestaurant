import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/common_widgets/row_module.dart';
import 'package:foodfestarestaurant/controller/account/components/display_customer_controller.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:get/get.dart';

import '../../../res/app_appbar.dart';

class DisplayCustomerScreen extends StatelessWidget {
  DisplayCustomerScreen({super.key});

  final DisplayCustomerController con = Get.put(DisplayCustomerController());

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
                      title: "Customer",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Obx(
                      () => con.isLoading.isTrue
                          ? const AppLoader()
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: con.getCustomerListData.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = con.getCustomerListData[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border:
                                        Border.all(color: Colors.transparent),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 2.0,
                                        blurStyle: BlurStyle.outer,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   item.identityNumber ?? "",
                                        //   maxLines: 1,
                                        //   overflow: TextOverflow.ellipsis,
                                        //   style: TextStyle(
                                        //       color: Theme.of(context)
                                        //           .primaryColor,
                                        //       fontWeight: FontWeight.w500,
                                        //       fontSize: 15.sp),
                                        // ),
                                        // Divider(
                                        //   color: AppColors.greyBorderColor,
                                        // ),
                                        RowModule(
                                          title: "Name",
                                          subTitle:
                                              "${item.firstName ?? ""} ${item.lastName ?? ""}",
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        RowModule(
                                          title: "Email",
                                          subTitle: item.email ?? "",
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        RowModule(
                                          title: "Contact No.",
                                          subTitle: item.phone ?? "",
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        RowModule(
                                          title:
                                              "Total Delivered Order                       fd",
                                          subTitle: "${item.ordersCount ?? 0}",
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        RowModule(
                                          title: "Status",
                                          subTitle: item.status == 1
                                              ? "Active"
                                              : "In-Active",
                                          customTextStyle: TextStyle(
                                              color: item.status == 1
                                                  ? AppColors.green
                                                  : AppColors.red,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        RowModule(
                                          title: "Verified",
                                          subTitle: item.isVerified == 1
                                              ? "Yes"
                                              : "No",
                                          customTextStyle: TextStyle(
                                              color: item.status == 1
                                                  ? AppColors.green
                                                  : AppColors.red,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ]),
                                ).paddingSymmetric(
                                    horizontal: 15.w, vertical: 5);
                              },
                            ),
                    )
                  ]));
            }));
  }
}
