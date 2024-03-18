import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/order_management_controller.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:foodfestarestaurant/res/app_text_field.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/app_assets.dart';
import '../../../../res/app_strings.dart';
import '../../../../res/widgets/empty_element.dart';

class OrderManagementScreen extends StatelessWidget {
  OrderManagementScreen({super.key});

  final OrderManagementController con = Get.put(OrderManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
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
                    color: Colors.transparent,
                  ),
                  onPressed: () {
                    // Get.back();
                  },
                ),
                Text(
                  "Order Management",
                  style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      _filterBottomSheet();
                    },
                    child: const Icon(Icons.filter_alt),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: Column(
              children: [
                Obx(
                  () => Expanded(
                    child: con.isLoader.isTrue
                        ? const AppLoader()
                        : con.getOrderHistoryFilterList.isEmpty
                            ? RefreshIndicator(
                                onRefresh: () async {
                                  await DesktopRepository().getOrderHistoryFilterApiCall(
                                    isInitial: true,
                                    fromdDate: con.fromDateCon.value.text,
                                    toDate: con.toDateCon.value.text,
                                  );
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
                                  await DesktopRepository().getOrderHistoryFilterApiCall(
                                    isInitial: true,
                                    fromdDate: con.fromDateCon.value.text,
                                    toDate: con.toDateCon.value.text,
                                  );
                                },
                                child: ListView.builder(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  itemCount: con.getOrderHistoryFilterList.length,
                                  // padding: EdgeInsets.zero,
                                  itemBuilder: (BuildContext context, int index) {
                                    var item = con.getOrderHistoryFilterList[index];
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.orderManagementDetailScreen, arguments: {'orderId': item.id});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                            color: AppColors.white,
                                            boxShadow: AppStyle.boxShadow(),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Order No.# ",
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                                      ),
                                                      Text(
                                                        item.invoiceNumber ?? "",
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      Get.toNamed(AppRoutes.orderManagementDetailScreen, arguments: {'orderId': item.id});
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_forward,
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
                                                  style:
                                                      TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                                ),
                                                Text(
                                                  "Status: ",
                                                  style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                  decoration:
                                                      BoxDecoration(borderRadius: BorderRadius.circular(6), color: Theme.of(context).primaryColor),
                                                  child: Text(
                                                    item.orderStatus?.statusName ?? "",
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
                                                  style:
                                                      TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                                ),
                                                Text(
                                                  "Status: ",
                                                  style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 13.sp),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                  decoration:
                                                      BoxDecoration(borderRadius: BorderRadius.circular(6), color: Theme.of(context).primaryColor),
                                                  child: Text(
                                                    item.paymentStatus?.statusName ?? "",
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
                                              height: 3.h,
                                            ),
                                            Text(
                                              "Date : ${DateFormat("DD MMM,yyyy").format(item.createdAt!)}",
                                              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 12.sp),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text(
                                              "Restaurant Name : ${item.restaurant?.restaurantName}",
                                              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 12.sp),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text(
                                              "Customer Name : ${item.user?.firstName} ${item.user?.lastName}",
                                              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 12.sp),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text(
                                              "Customer Name : ${item.user?.firstName} ${item.user?.lastName}",
                                              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 12.sp),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text(
                                              "Amount : ${item.orderAmount}",
                                              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 12.sp),
                                            ),
                                          ],
                                        ).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
                                      ).paddingSymmetric(vertical: 3.h, horizontal: 10.w),
                                    );
                                  },
                                ),
                              ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _filterBottomSheet() {
    Get.bottomSheet(
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          height: Get.height / 2.4,
          width: Get.width,
          decoration: BoxDecoration(
              color: Theme.of(Get.context!).colorScheme.background,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Filter",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 18.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 40.h,
                child: AppTextField(
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)), borderSide: BorderSide(color: AppColors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)), borderSide: BorderSide(color: AppColors.white)),
                  hintText: "Enter Name",
                  hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.hintColor),
                  controller: con.nameCon.value,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 40.h,
                child: AppTextField(
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)), borderSide: BorderSide(color: AppColors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)), borderSide: BorderSide(color: AppColors.white)),
                  hintText: "Enter Fromdate",
                  hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.hintColor),
                  suffixIcon: const Icon(Icons.timer),
                  suffixOnTap: () async {
                    DateTime? pickedDate =
                        await showDatePicker(context: Get.context!, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-M-d').format(pickedDate);

                      con.fromDateCon.value.text = formattedDate;
                    } else {}
                  },
                  controller: con.fromDateCon.value,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 40.h,
                child: AppTextField(
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)), borderSide: BorderSide(color: AppColors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)), borderSide: BorderSide(color: AppColors.white)),
                  hintText: "Enter Todate",
                  hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.hintColor),
                  suffixIcon: const Icon(Icons.timer),
                  suffixOnTap: () async {
                    DateTime? pickedDate =
                        await showDatePicker(context: Get.context!, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-M-d').format(pickedDate);

                      con.toDateCon.value.text = formattedDate;
                    } else {}
                  },
                  controller: con.toDateCon.value,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              AppButton(
                height: 30.h,
                onPressed: () async {
                  Get.back();
                  await DesktopRepository()
                      .getOrderHistoryFilterApiCall(
                          isInitial: true, search: con.nameCon.value.text, fromdDate: con.fromDateCon.value.text, toDate: con.toDateCon.value.text)
                      .then((value) => con.nameCon.value.clear());
                },
                child: Text(
                  "Search",
                  style: TextStyle(color: AppColors.white, fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              )
            ],
          )),
      // barrierColor: AppColors.blackColor,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(35),
      //     side: BorderSide(width: 5, color: Colors.black)),
      enableDrag: false,
    );
  }
}
