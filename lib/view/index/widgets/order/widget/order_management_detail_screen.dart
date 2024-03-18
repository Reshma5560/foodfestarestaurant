// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/order_management_detail_controller.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:get/get.dart';

class OrderManagementDetailScreen extends StatelessWidget {
  OrderManagementDetailScreen({super.key});

  final OrderManagementDetailController con = Get.put(OrderManagementDetailController());

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
                        "Order Detail",
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
                        : ListView(padding: EdgeInsets.zero, children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                  color: AppColors.white,
                                  boxShadow: AppStyle.boxShadow(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Restaurant: ",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                          ),
                                          Text(
                                            con.getOrderDataModel.value.data?.restaurant?.restaurantName ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          var fileName = "Food fiesta ${con.getOrderDataModel.value.data?.id ?? ""}";
                                          con.downloadFile(url: con.getOrderDataModel.value.data?.downloadInvoice ?? "", fileName: fileName);
                                        },
                                        child: Icon(
                                          Icons.download,
                                          size: 18.sp,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Order ",
                                      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                    ),
                                    Text(
                                      "Status: ",
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Theme.of(context).primaryColor),
                                      child: Text(
                                        con.getOrderDataModel.value.data?.orderStatus?.statusName ?? "",
                                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 8.sp),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Payment ",
                                      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                    ),
                                    Text(
                                      "Status: ",
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Theme.of(context).primaryColor),
                                      child: Text(
                                        con.getOrderDataModel.value.data?.paymentStatus?.statusName ?? "",
                                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 8.sp),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Item",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Price",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Quantity",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Subtotal",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                ),
                                _OrderModule(),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                    Text(
                                      "\$ ${con.getOrderDataModel.value.data?.orderAmount ?? " "}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tax",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                    Text(
                                      "\$ ${con.getOrderDataModel.value.data?.totalTaxAmount ?? " "}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Discount",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                    Text(
                                      "\$ ${con.getOrderDataModel.value.data!.discountTotal}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery Charge",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                    Text(
                                      "\$ ${con.getOrderDataModel.value.data!.deliveryCharge}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Grand Total",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                    ),
                                    Text(
                                      "\$ ${con.getOrderDataModel.value.data!.orderAmount}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
                                    ),
                                  ],
                                ),
                                // Divider(
                                //   color: Theme.of(context)
                                //       .primaryColor,
                                // ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ]).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
                            ).paddingSymmetric(vertical: 3.h, horizontal: 10.w),
                          ]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _OrderModule() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: con.getOrderDataModel.value.data?.orderDetail?.length,
      itemBuilder: (BuildContext context, int index) {
        var item = con.getOrderDataModel.value.data?.orderDetail![index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "${index + 1}. ${item?.food?.foodName ?? ""}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
              ),
            ),
            Expanded(
              child: Text(
                "${item?.price ?? ""}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
              ),
            ),
            Expanded(
              child: Text(
                "${item?.quantity ?? ""}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
              ),
            ),
            Expanded(
              child: Text(
                item?.totalAmount ?? "",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 11.sp),
              ),
            ),
          ],
        );
      },
    );
  }
}
// ₹
