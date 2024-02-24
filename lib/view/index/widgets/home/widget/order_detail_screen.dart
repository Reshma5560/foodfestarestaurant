// // ignore_for_file: prefer_is_empty

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:foodfestarestaurant/controller/order_detail_controller.dart';
// import 'package:foodfestarestaurant/res/app_appbar.dart';
// import 'package:foodfestarestaurant/res/app_colors.dart';
// import 'package:foodfestarestaurant/res/app_loader.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class OrderDetailScreen extends StatelessWidget {
//   OrderDetailScreen({super.key});
//   final OrderDetailController con = Get.put(OrderDetailController());
//   @override
//   Widget build(BuildContext context) {
//     // var item = con.getOrderDataModel.value.data;
//     return Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: TweenAnimationBuilder(
//           duration: const Duration(milliseconds: 1000),
//           curve: Curves.easeOutCubic,
//           tween: Tween(begin: 20.0, end: 1.0),
//           builder: (context, value, child) {
//             return AnimatedOpacity(
//               opacity: value == 20 ? 0 : 1,
//               duration: const Duration(milliseconds: 700),
//               child: Stack(
//                 children: [
//                   Image.asset("assets/images/appbar_bg_img.png"),
//                   Column(
//                     children: [
//                       CommonAppBar(
//                         title: "Order Details",
//                         onPressed: () {
//                           Get.back();
//                         },
//                       ),
//                       Expanded(
//                           child: Obx(() => con.isLoading.isTrue
//                               ? const AppLoader()
//                               : ListView(
//                                   padding: EdgeInsets.zero,
//                                   children: [
//                                     Text(
//                                       con.getOrderDataModel.value.data
//                                               ?.invoiceNumber ??
//                                           "",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           color: Theme.of(context).primaryColor,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14.sp),
//                                     ),

//                                     SizedBox(
//                                       height: 5.h,
//                                     ),
//                                     // Text(
//                                     //   DateFormat("dd MM yyyy, HH:mma").format(DateTime.now()
//                                     //       // item.createdAt!
//                                     //       ),
//                                     //   style: TextStyle(
//                                     //       fontWeight: FontWeight.w500, fontSize: 12.sp),
//                                     // ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10.w, vertical: 5.h),
//                                       decoration: BoxDecoration(
//                                         color: AppColors.white,
//                                         border: Border.all(
//                                             color: Colors.transparent),
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             color: Colors.grey,
//                                             offset: Offset(0.0, 1.0), //(x,y)
//                                             blurRadius: 2.0,
//                                             blurStyle: BlurStyle.outer,
//                                           ),
//                                         ],
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               con.getOrderDataModel.value.data
//                                                           ?.restaurant?.logo !=
//                                                       null
//                                                   ? Image.network(
//                                                       con
//                                                               .getOrderDataModel
//                                                               .value
//                                                               .data
//                                                               ?.restaurant
//                                                               ?.logo ??
//                                                           "",
//                                                       height: 40,
//                                                       width: 40,
//                                                     )
//                                                   : Container(),
//                                               SizedBox(
//                                                 width: 10.w,
//                                               ),
//                                               Text(
//                                                 con
//                                                         .getOrderDataModel
//                                                         .value
//                                                         .data
//                                                         ?.restaurant
//                                                         ?.restaurantName ??
//                                                     "",
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 12.sp),
//                                               ),
//                                             ],
//                                           ),
//                                           Divider(
//                                             color: AppColors.grey,
//                                             thickness: 1,
//                                           ),
//                                           InkWell(
//                                             onTap: () async {
//                                               Uri phoneno = Uri.parse(
//                                                   '${con.getOrderDataModel.value.data?.restaurant?.phone}');
//                                               if (await launchUrl(phoneno)) {
//                                                 //dialer opened
//                                               } else {
//                                                 //dailer is not opened
//                                               }
//                                             },
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Icon(
//                                                   Icons.call,
//                                                   size: 18.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Text(
//                                                   "Call",
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       fontSize: 12.sp),
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),

//                                     SizedBox(
//                                       height: 10.h,
//                                     ),

//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10.w, vertical: 5.h),
//                                       decoration: BoxDecoration(
//                                         color: AppColors.white,
//                                         border: Border.all(
//                                             color: Colors.transparent),
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             color: Colors.grey,
//                                             offset: Offset(0.0, 1.0), //(x,y)
//                                             blurRadius: 2.0,
//                                             blurStyle: BlurStyle.outer,
//                                           ),
//                                         ],
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Customer Contact Details",
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w700,
//                                                 fontSize: 14.sp),
//                                           ),
//                                           Row(
//                                             children: [
//                                               con.getOrderDataModel.value.data
//                                                           ?.user?.image !=
//                                                       null
//                                                   ? Image.network(
//                                                       con
//                                                           .getOrderDataModel
//                                                           .value
//                                                           .data
//                                                           ?.user
//                                                           ?.image,
//                                                       height: 40,
//                                                       width: 40,
//                                                     )
//                                                   : Container(),
//                                               Text(
//                                                 "${con.getOrderDataModel.value.data?.user?.firstName} ${con.getOrderDataModel.value.data?.user?.lastName}",
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 12.sp),
//                                               ),
//                                             ],
//                                           ),
//                                           Divider(
//                                             color: AppColors.grey,
//                                             thickness: 1,
//                                           ),
//                                           InkWell(
//                                             onTap: () async {
//                                               Uri phoneno = Uri.parse(
//                                                   '${con.getOrderDataModel.value.data?.user?.phone}');
//                                               if (await launchUrl(phoneno)) {
//                                                 //dialer opened
//                                               } else {
//                                                 //dailer is not opened
//                                               }
//                                             },
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Icon(
//                                                   Icons.call,
//                                                   size: 18.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Text(
//                                                   "Call",
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       fontSize: 12.sp),
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),

//                                     SizedBox(
//                                       height: 10.h,
//                                     ),

//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Item : ${con.getOrderDataModel.value.data?.orderDetail?[0].quantity}",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 14.sp),
//                                         ),
//                                         ElevatedButton(
//                                           style: ButtonStyle(
//                                             shape: MaterialStateProperty.all<
//                                                 RoundedRectangleBorder>(
//                                               RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5.0),
//                                               ),
//                                             ),
//                                           ),
//                                           onPressed: null,
//                                           child: Text(con
//                                                   .getOrderDataModel
//                                                   .value
//                                                   .data
//                                                   ?.paymentType
//                                                   ?.paymentTypeName ??
//                                               ""),
//                                         ),
//                                       ],
//                                     ),

//                                     Divider(
//                                       color: AppColors.greyBorderColor,
//                                     ),
//                                     _orderModule(),

//                                     Divider(
//                                       color: AppColors.greyBorderColor,
//                                     ),
//                                     SizedBox(
//                                       height: 20.h,
//                                     ),
//                                     Text(
//                                       "Payment",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 14.sp),
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     Text(
//                                       "Total Amount",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 11.sp),
//                                     ),
//                                     Text(
//                                       con.getOrderDataModel.value.data
//                                               ?.orderAmount
//                                               .toString() ??
//                                           "",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 12.sp),
//                                     ),
//                                     SizedBox(
//                                       height: 8.h,
//                                     ),

//                                     Text(
//                                       "Payment Status",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 11.sp),
//                                     ),
//                                     Text(
//                                       con.getOrderDataModel.value.data
//                                               ?.paymentStatus?.statusName ??
//                                           "",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 12.sp),
//                                     ),
//                                     SizedBox(
//                                       height: 30.h,
//                                     ),

//                                     // Row(
//                                     //   mainAxisAlignment: MainAxisAlignment.center,
//                                     //   children: [
//                                     //     ElevatedButton(
//                                     //       style: ButtonStyle(
//                                     //         shape: MaterialStateProperty.all<
//                                     //             RoundedRectangleBorder>(
//                                     //           RoundedRectangleBorder(
//                                     //             borderRadius:
//                                     //                 BorderRadius.circular(5.0),
//                                     //           ),
//                                     //         ),
//                                     //       ),
//                                     //       onPressed: () {
//                                     //         var params = {
//                                     //           "order_id": con
//                                     //               .getOrderDataModel.value.data?.id,
//                                     //           "status":
//                                     //               "2" // 1-pending BYDEFAULT | 2-ACCEPT | 3 -REJECT
//                                     //         };
//                                     //         DesktopRepository()
//                                     //             .acceptOrderApiCall(
//                                     //                 isLoader: con.isLoading,
//                                     //                 params: params)
//                                     //             .then((value) =>
//                                     //                 con.isAccept.value = true);
//                                     //       },
//                                     //       child: const Text("Accept"),
//                                     //     ),
//                                     //     SizedBox(
//                                     //       width: 10.w,
//                                     //     ),
//                                     //     ElevatedButton(
//                                     //       style: ButtonStyle(
//                                     //         shape: MaterialStateProperty.all<
//                                     //             RoundedRectangleBorder>(
//                                     //           RoundedRectangleBorder(
//                                     //             borderRadius:
//                                     //                 BorderRadius.circular(5.0),
//                                     //           ),
//                                     //         ),
//                                     //       ),
//                                     //       onPressed: con.isAccept.value == true
//                                     //           ? null
//                                     //           : () {
//                                     //               var params = {
//                                     //                 "order_id": con
//                                     //                     .getOrderDataModel
//                                     //                     .value
//                                     //                     .data
//                                     //                     ?.id,
//                                     //                 "status":
//                                     //                     "3" // 1-pending BYDEFAULT | 2-ACCEPT | 3 -REJECT
//                                     //               };
//                                     //               DesktopRepository()
//                                     //                   .acceptOrderApiCall(
//                                     //                       isLoader: con.isLoading,
//                                     //                       params: params);
//                                     //             },
//                                     //       child: const Text("Reject"),
//                                     //     ),
//                                     //   ],
//                                     // )
//                                   ],
//                                 ).paddingSymmetric(
//                                   horizontal: 10.w, vertical: 10.h)))
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ));
//   }

//   Widget _orderModule() {
//     return ListView.builder(
//       padding: EdgeInsets.zero,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: con.getOrderDataModel.value.data?.orderDetail?.length,
//       itemBuilder: (BuildContext context, int index) {
//         var item = con.getOrderDataModel.value.data?.orderDetail?[index];
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               item?.food?.image ?? "",
//               height: 40.h,
//               width: 40.w,
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item?.food?.foodName ?? "",
//                   style:
//                       TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
//                 ),
//                 Text("₹${item?.food?.price.toString() ?? ""}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600, fontSize: 15.sp)),
//                 // Text(
//                 //   "Quantity : ${item?.quantity?.toString() ?? ""}",
//                 //   style:
//                 //       TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
//                 // ),
//                 Row(
//                   children: [
//                     const Text("Addons :"),
//                     item?.addon?.length == 0
//                         ? Container()
//                         : Expanded(
//                             child: Row(
//                               children: [
//                                 ...item!.addon!.map((addons) {
//                                   return Text("${addons.addonName},");
//                                 }).toList(),
//                               ],
//                             ),
//                           ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     const Text("Variants :"),
//                     item?.variant?.length == 0
//                         ? Container()
//                         : Column(
//                             children: [
//                               ...item!.variant!.map((varients) {
//                                 return Text(
//                                   "${varients.variationOptionName ?? ""}, ",
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 3,
//                                 );
//                               }).toList(),
//                             ],
//                           ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ).paddingSymmetric(vertical: 5);
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/order_detail_controller.dart';
import 'package:foodfestarestaurant/res/app_appbar.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailScreen extends StatelessWidget {
  OrderDetailScreen({super.key});
  final OrderDetailController con = Get.put(OrderDetailController());
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
                  Image.asset("assets/images/appbar_bg_img.png"),
                  Column(
                    children: [
                      CommonAppBar(
                        title: "Order Details",
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Expanded(
                          child: Obx(() => con.isLoading.isTrue
                              ? const AppLoader()
                              : ListView(padding: EdgeInsets.zero, children: [
                                  Container(
                                    // margin: EdgeInsets.symmetric(vertical: 3.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2),
                                        color: AppColors.white,
                                        boxShadow: AppStyle.boxShadow(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "ORDER# ",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp),
                                            ),
                                            Text(
                                              con.getOrderDataModel.value.data
                                                      ?.invoiceNumber ??
                                                  "",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Status: ",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 2.h),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              child: Text(
                                                con
                                                        .getOrderDataModel
                                                        .value
                                                        .data
                                                        ?.orderStatus
                                                        ?.statusName ??
                                                    "",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text(
                                          "Customer Details",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          "Name : ${con.getOrderDataModel.value.data?.user?.firstName} ${con.getOrderDataModel.value.data?.user?.lastName}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11.sp),
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Mobile No. : ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11.sp),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                await con
                                                    .requestStoragePermission();

                                                Uri phoneno = Uri.parse(
                                                    '${con.getOrderDataModel.value.data?.user?.phone}');
                                                if (await launchUrl(phoneno)) {
                                                  //dialer opened
                                                } else {
                                                  //dailer is not opened
                                                }
                                              },
                                              child: Text(
                                                "${con.getOrderDataModel.value.data?.user?.phone}",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Text(
                                          "Address : ${con.getOrderDataModel.value.data?.deliveryAddress?.address}, ${con.getOrderDataModel.value.data?.deliveryAddress?.city?.cityName}, ${con.getOrderDataModel.value.data?.deliveryAddress?.state?.stateName}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11.sp),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        con.isViewMore.isTrue
                                            ? _buildViewMoreModule()
                                            : const SizedBox(),
                                        InkWell(
                                          onTap: () {
                                            con.isViewMore.value =
                                                !con.isViewMore.value;
                                          },
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 2.h),
                                              decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.r),
                                                  border: Border.all(
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    con.isViewMore.isTrue
                                                        ? "View less"
                                                        : "View more.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 11.sp),
                                                  ),
                                                  Icon(
                                                    con.isViewMore.isTrue
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ).paddingSymmetric(
                                        vertical: 10, horizontal: 10),
                                  ).paddingSymmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                ])))
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }

  Widget _orderModule() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: con.getOrderDataModel.value.data?.orderDetail?.length,
      itemBuilder: (BuildContext context, int index) {
        var item = con.getOrderDataModel.value.data?.orderDetail?[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.food?.foodName ?? "",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                ),
                Text("${item?.food?.price.toString() ?? ""} ₹",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12.sp)),

                // Row(
                //   children: [
                //     const Text("Addons :"),
                //     item?.addon?.length == 0
                //         ? Container()
                //         : Expanded(
                //             child: Row(
                //               children: [
                //                 ...item!.addon!.map((addons) {
                //                   return Text("${addons.addonName},");
                //                 }).toList(),
                //               ],
                //             ),
                //           ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     const Text("Variants :"),
                //     item?.variant?.length == 0
                //         ? Container()
                //         : Column(
                //             children: [
                //               ...item!.variant!.map((varients) {
                //                 return Text(
                //                   "${varients.variationOptionName ?? ""}, ",
                //                   overflow: TextOverflow.ellipsis,
                //                   maxLines: 3,
                //                 );
                //               }).toList(),
                //             ],
                //           ),
                //   ],
                // ),
              ],
            )
          ],
        ).paddingSymmetric(vertical: 5);
      },
    );
  }

  _buildViewMoreModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: AppColors.greyBorderColor,
        ),
        Text(
          "Item",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
        ),
        _orderModule(),
        Divider(
          color: AppColors.greyBorderColor,
        ),
        Text(
          "Payment",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          "Total Amount",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
        ),
        Text(
          "${con.getOrderDataModel.value.data?.orderAmount.toString() ?? ""} ₹",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Payment Status",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
        ),
        Text(
          con.getOrderDataModel.value.data?.paymentStatus?.statusName ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
