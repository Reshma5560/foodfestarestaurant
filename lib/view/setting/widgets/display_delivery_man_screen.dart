// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/common_widgets/row_module.dart';
import 'package:foodfestarestaurant/controller/setting/components/display_deliveryman_controller.dart';
import 'package:foodfestarestaurant/repositories/account_repositories.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DisplayDeliveryManScreen extends StatelessWidget {
  DisplayDeliveryManScreen({super.key});

  final DisplayDeliveryManController con = Get.put(DisplayDeliveryManController());

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
                        "Deliveryman",
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
                      await AccountRepository().getDeliverymanApiCall(isLoader: con.isLoading);
                    },
                    child: Obx(
                      () => con.isLoading.isTrue
                          ? const AppLoader()
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: con.getDeliverymanListData.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = con.getDeliverymanListData.value[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                      boxShadow: AppStyle.boxShadow(),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "IDENTIFY NUMBER: ",
                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp, color: AppColors.black),
                                          ),
                                          Text(
                                            item.identityNumber ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      RowModule(
                                        title: "Name",
                                        subTitle: "${item.user?.firstName ?? ""} ${item.user?.lastName ?? ""}",
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      RowModule(
                                        title: "Email",
                                        subTitle: item.user?.email ?? "",
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      RowModule(
                                        title: "Contact No.",
                                        subTitle: item.user?.phone ?? "",
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      RowModule(title: "Identity Type", subTitle: "${item.identityType}"),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      RowModule(title: "Current Order", subTitle: "${item.currentOrders ?? 0}"),
                                      SizedBox(
                                        height: 13.h,
                                      ),
                                      Text(
                                        "Orders",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                                      ),
                                      ...item.orders!.map(
                                        (e) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                boxShadow: AppStyle.boxShadow(),
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Order# ",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w600, fontSize: 13.sp, color: Theme.of(context).primaryColor),
                                                    ),
                                                    Text(
                                                      e.invoiceNumber ?? "",
                                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                RowModule(
                                                    title: "Order Date",
                                                    subTitle: DateFormat('dd MM,yyyy hh:mma').format(e.createdAt ?? DateTime.now())),
                                                RowModule(title: "Order Amount", subTitle: "₹${e.orderAmount ?? ""}"),
                                              ],
                                            ),
                                          ).paddingSymmetric(vertical: 5.h);
                                        },
                                      ).toList()
                                    ],
                                  ),
                                ).paddingSymmetric(horizontal: 15.w, vertical: 5.h);
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
}
