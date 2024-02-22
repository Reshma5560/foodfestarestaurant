import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/common_widgets/simmer_tile.dart';
import 'package:foodfestarestaurant/controller/home/home_controller.dart';
import 'package:foodfestarestaurant/data/models/cureent_order_status_model.dart';
import 'package:foodfestarestaurant/data/models/current_order_model.dart';
import 'package:foodfestarestaurant/repositories/desktop_repository.dart';
import 'package:foodfestarestaurant/res/app_appbar.dart';
import 'package:foodfestarestaurant/res/app_assets.dart';
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
        body: Column(children: [
          CommonAppBar(
            title: "Orders",
            isLeadingShow: false,
            onPressed: () {
              Get.back();
            },
          ),
          TabBar(
            physics: const NeverScrollableScrollPhysics(),
            automaticIndicatorColorAdjustment: false,
            controller: con.tabController,
            tabs: con.orderTabList,
            onTap: (value) {
              con.tabIndex.value = value;
              if (con.tabIndex.value == 0) {
                DesktopRepository().getCurrentOrderListAPI(isInitial: true);
              } else if (con.tabIndex.value == 1) {
                DesktopRepository().getRequestOrderListAPI(isInitial: true);
              } else if (con.tabIndex.value == 2) {
                DesktopRepository().getCompletedOrderListAPI(isInitial: true);
              }
            },
          ),
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: con.tabController,
                children: con.orderTabList.map((e) {
                  return e.text == "Current Order"
                      ? RefreshIndicator(
                          onRefresh: () async {
                            await DesktopRepository()
                                .getCurrentOrderListAPI(isInitial: true);
                          },
                          child: _currentOrderModule())
                      : e.text == "Request Order"
                          ? RefreshIndicator(
                              onRefresh: () async {
                                await DesktopRepository()
                                    .getRequestOrderListAPI(isInitial: true);
                              },
                              child: _requestOrderModule())
                          : RefreshIndicator(
                              onRefresh: () async {
                                await DesktopRepository()
                                    .getCompletedOrderListAPI(isInitial: true);
                              },
                              child: _pastOrderModule());
                }).toList()),
          ),
        ]));
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
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.invoiceNumber.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          ),
                          Divider(
                            color: AppColors.greyBorderColor,
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
          // menuMaxHeight: 400,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey),
            ),
          ),
          hint: const Text("Select Order status"),
          value: con.orderstatusDropDownValue.value,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.grey,
          ),
          items: con.getCurrentOrderStatusListData
              .map<DropdownMenuItem<CurrentOrderStatusDatum>>((value) {
            // log("value.name ${value.countryName}");
            return DropdownMenuItem<CurrentOrderStatusDatum>(
              value: value,
              child: Text(
                value.statusName ?? "",
                style: TextStyle(
                  color: AppColors.greyFontColor,
                  fontSize: 11.sp,
                ),
              ),
            );
          }).toList(),
          isDense: true,
          isExpanded: false,
          dropdownColor: AppColors.white,
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
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.invoiceNumber.toString(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          ),
                          Divider(
                            color: AppColors.greyBorderColor,
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
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  var params = {
                                    "order_id": item.id,
                                    "status": 2
                                  };
                                  DesktopRepository()
                                      .acceptOrderApiCall(
                                          isLoader: con.isLoading,
                                          params: params)
                                      .then((value) => isAccept.value = true);
                                },
                                child: const Text("Accept"),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  var params = {
                                    "order_id": item.id,
                                    "status": 3
                                  };
                                  DesktopRepository()
                                      .acceptOrderApiCall(
                                          isLoader: con.isLoading,
                                          params: params)
                                      .then((value) => isAccept.value = true);
                                },
                                child: const Text("Reject"),
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
                itemCount: con.completeOrderListData.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = con.completeOrderListData[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 3.h),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: AppStyle.boxShadow(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.invoiceNumber.toString(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                        ),
                        Divider(
                          color: AppColors.greyBorderColor,
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
}
