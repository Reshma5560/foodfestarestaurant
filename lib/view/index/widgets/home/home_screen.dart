import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/common_widgets/simmer_tile.dart';
import 'package:foodfestarestaurant/controller/home/home_controller.dart';
import 'package:foodfestarestaurant/data/models/cureent_order_status_model.dart';
import 'package:foodfestarestaurant/data/models/current_order_model.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:foodfestarestaurant/res/app_assets.dart';
import 'package:foodfestarestaurant/res/app_button.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_strings.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:foodfestarestaurant/res/widgets/empty_element.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/row_module.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController con = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterTop,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Image.asset("assets/images/bg_shade.png"),
            Column(children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(9.r),
                  //   child:
                  //       //  Container(
                  //       //   color: AppColors.black,
                  //       //   height: 40.h,
                  //       //   width: 40.w,`
                  //       // )
                  //       Image.network(
                  //     "https://foodfiesta.omtecweb.com/storage/deliveryman_profile/${con.userImage.value}",
                  //     // AppAssets.appLogo,
                  //     fit: BoxFit.cover,
                  //     height: 35.h,
                  //     width: 40.w,
                  //   ),
                  // ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyFontColor),
                      ),
                      Text(
                        "${con.firstName.value} ${con.lastName.value}",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black),
                      )
                    ],
                  )
                ],
              ).paddingSymmetric(horizontal: 10.w, vertical: 20.h),
              _tabBarWidget(),
              // TabBar(
              //   physics: const NeverScrollableScrollPhysics(),
              //   automaticIndicatorColorAdjustment: false,
              //   controller: con.tabController,
              //   tabs: con.orderTabList,
              //   onTap: (value) {
              //     con.tabIndex.value = value;
              //     if (con.tabIndex.value == 0) {
              //       DesktopRepository().getCurrentOrderListAPI(isInitial: true);
              //     } else if (con.tabIndex.value == 1) {
              //       DesktopRepository().getRequestOrderListAPI(isInitial: true);
              //     } else if (con.tabIndex.value == 2) {
              //       DesktopRepository()
              //           .getCompletedOrderListAPI(isInitial: true);
              //     }
              //   },
              // ),
              Obx(() => Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: con.tabController,
                        children: con.orderTabList.map((e) {
                          return con.tabIndex.value == 0
                              ? RefreshIndicator(
                                  onRefresh: () async {
                                    await DesktopRepository()
                                        .getCurrentOrderListAPI(
                                            isInitial: true);
                                  },
                                  child: _currentOrderModule())
                              : con.tabIndex.value == 1
                                  ? RefreshIndicator(
                                      onRefresh: () async {
                                        await DesktopRepository()
                                            .getRequestOrderListAPI(
                                                isInitial: true);
                                      },
                                      child: _requestOrderModule())
                                  : RefreshIndicator(
                                      onRefresh: () async {
                                        await DesktopRepository()
                                            .getCompletedOrderListAPI(
                                                isInitial: true);
                                      },
                                      child: _pastOrderModule());
                        }).toList()),
                  )),
            ]),
          ],
        ));
  }

  Widget _currentOrderModule() {
    return Obx(() => con.isLoading.value
        ? ListView.builder(
            padding: const EdgeInsets.all(defaultPadding)
                .copyWith(bottom: MediaQuery.of(Get.context!).padding.bottom),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, index) => const SimmerTile(),
          )
        : con.currentOrderListData.isEmpty
            ? EmptyElement(
                imagePath: AppAssets.noData,
                height: Get.height / 1.8,
                imageHeight: Get.width / 2.4,
                imageWidth: Get.width / 2,
                spacing: 0,
                title: AppStrings.recordNotFound,
                subtitle: "",
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                controller: con.currentOrderScrollController,
                itemCount: con.currentOrderListData.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = con.currentOrderListData[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.orderDetailScreen,
                          arguments: {'orderId': item.id});
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 3.h),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: AppStyle.boxShadow(),
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order# ",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp),
                              ),
                              Text(
                                item.invoiceNumber.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp),
                              ),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                          ),
                          RowModule(
                            title: "Receiver Name",
                            subTitle:
                                ": ${item.user?.firstName} ${item.user?.lastName}",
                          ),
                          RowModule(
                            title: "Receiver Contact No.",
                            subTitle: ": ${item.user?.phone}",
                          ),
                          RowModule(
                            title: "Order Status",
                            subTitle: ": ${item.orderStatus?.statusName}",
                            customTextStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: _orderStatusDropDownModule(item)),
                                  const Expanded(child: SizedBox())
                                ],
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ).paddingSymmetric(vertical: 10, horizontal: 10),
                    ),
                  );
                },
              ).paddingSymmetric(horizontal: 10.w, vertical: 5));
  }

  Widget _orderStatusDropDownModule(CurrentOrderDatum item) {
    return Obx(() => DropdownButtonFormField<CurrentOrderStatusDatum>(
         decoration: InputDecoration(
            fillColor: Theme.of(Get.context!).primaryColor, //AppColors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
          ),
          hint: const Text("Select Order status"),
          value: con.orderstatusDropDownValue.value,
          icon: Icon(
            Icons.arrow_drop_down,
            color: AppColors.white,
          ),
          items: con.getCurrentOrderStatusListData
              .map<DropdownMenuItem<CurrentOrderStatusDatum>>((value) {
            // log("value.name ${value.countryName}");
            return DropdownMenuItem<CurrentOrderStatusDatum>(
              value: value,
              child: Text(
                value.statusName ?? "",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 11.sp,
                ),
              ),
            );
          }).toList(),
          isDense: true,
          isExpanded: false,
          dropdownColor: Theme.of(Get.context!).primaryColor,
          // underline: Container(height: 1, color: AppColors.blackColor),
          // borderRadius: const BorderRadius.all(Radius.circular(15)),
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 11.sp,
          ),
          onChanged: (value) async {
            con.isLoading(true);
            con.orderstatusDropDownValue.value =
                value ?? CurrentOrderStatusDatum();
            // con.stateList.clear();
            // con.stateList.add(StateList(stateName: 'Select state'));

            DesktopRepository().updateOrderStatusApiCall(
                isLoader: con.isLoading,
                params: {
                  "order_id": item.id,
                  "order_status_id": value?.id ?? ""
                });
            con.isLoading(false);
          },
        ));
  }

  Widget _requestOrderModule() {
    return Obx(() => con.isLoading.value
        ? ListView.builder(
            padding: const EdgeInsets.all(defaultPadding)
                .copyWith(bottom: MediaQuery.of(Get.context!).padding.bottom),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, index) => const SimmerTile(),
          )
        : con.requestOrderListData.isEmpty
            ? EmptyElement(
                imagePath: AppAssets.noData,
                height: Get.height / 1.8,
                imageHeight: Get.width / 2.4,
                imageWidth: Get.width / 2,
                spacing: 0,
                title: AppStrings.recordNotFound,
                subtitle: "",
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                controller: con.requestOrderScrollController,
                itemCount: con.requestOrderListData.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = con.requestOrderListData[index];

                  RxBool isAccept = false.obs;
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.orderDetailScreen, arguments: {
                        'orderId': item.id,
                        'isAccept': isAccept.value
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 3.h),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: AppStyle.boxShadow(),
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order# ",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp),
                              ),
                              Text(
                                item.invoiceNumber.toString(),
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp),
                              ),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                          ),
                          RowModule(
                            title: "Receiver Name",
                            subTitle:
                                ": ${item.user?.firstName} ${item.user?.lastName}",
                          ),
                          RowModule(
                            title: "Receiver Contact No.",
                            subTitle: ": ${item.user?.phone}",
                          ),
                          RowModule(
                            title: "Order Status",
                            subTitle: ": ${item.orderStatus?.statusName}",
                            customTextStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                child: AppButton(
                                  height: 25.h,
                                  borderRadius: BorderRadius.circular(5.0),
                                  onPressed: () {
                                    var params = {
                                      "order_id": item.id,
                                      "status": "order_confirmed"
                                    };
                                    DesktopRepository()
                                        .acceptOrderApiCall(
                                            isLoader: con.isLoading,
                                            params: params)
                                        .then((value) => isAccept.value = true);
                                  },
                                  child: Text(
                                    "Accept",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: AppButton(
                                  height: 25.h,
                                  borderRadius: BorderRadius.circular(5.0),
                                  onPressed: () {
                                    var params = {
                                      "order_id": item.id,
                                      "status": "cancelled_by_restaurant"
                                    };
                                    DesktopRepository()
                                        .acceptOrderApiCall(
                                            isLoader: con.isLoading,
                                            params: params)
                                        .then((value) => isAccept.value = true);
                                  },
                                  child: Text(
                                    "Reject",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ).paddingSymmetric(vertical: 10, horizontal: 10),
                    ),
                  );
                },
              ).paddingSymmetric(horizontal: 10.w, vertical: 5));
  }

  Widget _pastOrderModule() {
    return Obx(() => con.isLoading.value
        ? ListView.builder(
            padding: const EdgeInsets.all(defaultPadding)
                .copyWith(bottom: MediaQuery.of(Get.context!).padding.bottom),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, index) => const SimmerTile(),
          )
        : con.completeOrderListData.isEmpty
            ? EmptyElement(
                imagePath: AppAssets.noData,
                height: Get.height / 1.8,
                imageHeight: Get.width / 2.4,
                imageWidth: Get.width / 2,
                spacing: 0,
                title: AppStrings.recordNotFound,
                subtitle: "",
              )
            : ListView.builder(
                controller: con.pastOrderScrollController,
                padding: EdgeInsets.zero,
                itemCount: con.completeOrderListData.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = con.completeOrderListData[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 3.h),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: AppStyle.boxShadow(),
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Order# ",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                            Text(
                              item.invoiceNumber.toString(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor,
                        ),
                        RowModule(
                          title: "Receiver Name",
                          subTitle:
                              ": ${item.user?.firstName} ${item.user?.lastName}",
                        ),
                        RowModule(
                          title: "Receiver Contact No.",
                          subTitle: ": ${item.user?.phone}",
                        ),
                        RowModule(
                          title: "Order Status",
                          subTitle: ": ${item.orderStatus?.statusName}",
                          customTextStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     ElevatedButton(
                        //       style: ButtonStyle(
                        //         shape: MaterialStateProperty.all<
                        //             RoundedRectangleBorder>(
                        //           RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(5.0),
                        //           ),
                        //         ),
                        //       ),
                        //       onPressed: () {},
                        //       child: const Text("Accept"),
                        //     ),
                        //     SizedBox(
                        //       width: 5.w,
                        //     ),
                        //     ElevatedButton(
                        //       style: ButtonStyle(
                        //         shape: MaterialStateProperty.all<
                        //             RoundedRectangleBorder>(
                        //           RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(5.0),
                        //           ),
                        //         ),
                        //       ),
                        //       onPressed: () {},
                        //       child: const Text("Reject"),
                        //     ),
                        //   ],
                        // )
                      ],
                    ).paddingSymmetric(vertical: 10, horizontal: 10),
                  );
                },
              ).paddingSymmetric(horizontal: 10.w, vertical: 5));
  }

  Widget _tabBarWidget() {
    return Obx(() => Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  con.tabIndex.value = 0;
                  log(con.tabIndex.value.toString());
                  DesktopRepository().getCurrentOrderListAPI(isInitial: true);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          color: Theme.of(Get.context!).primaryColor),
                      color: con.tabIndex.value == 0
                          ? Theme.of(Get.context!).primaryColor
                          : AppColors.white),
                  child: Text(
                    "Current Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: con.tabIndex.value == 0
                            ? AppColors.white
                            : Theme.of(Get.context!).primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  con.tabIndex.value = 1;
                  log(con.tabIndex.value.toString());
                  DesktopRepository().getRequestOrderListAPI(isInitial: true);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          color: Theme.of(Get.context!).primaryColor),
                      color: con.tabIndex.value == 1
                          ? Theme.of(Get.context!).primaryColor
                          : AppColors.white),
                  child: Text(
                    "Request Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: con.tabIndex.value == 1
                            ? AppColors.white
                            : Theme.of(Get.context!).primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  con.tabIndex.value = 2;
                  log(con.tabIndex.value.toString());
                  DesktopRepository().getCompletedOrderListAPI(isInitial: true);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          color: Theme.of(Get.context!).primaryColor),
                      color: con.tabIndex.value == 2
                          ? Theme.of(Get.context!).primaryColor
                          : AppColors.white),
                  child: Text(
                    "Complete Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: con.tabIndex.value == 2
                            ? AppColors.white
                            : Theme.of(Get.context!).primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10.w));
  }
}
