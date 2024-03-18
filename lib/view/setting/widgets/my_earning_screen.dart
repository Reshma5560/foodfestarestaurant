import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/common_widgets/custom_earning_container.dart';
import 'package:foodfestarestaurant/controller/setting/components/my-earning_controller.dart';
import 'package:foodfestarestaurant/repositories/account_repositories.dart';
import 'package:foodfestarestaurant/res/app_assets.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../res/app_style.dart';

class MyEarningScreen extends StatelessWidget {
  MyEarningScreen({super.key});

  final MyEarningController con = Get.put(MyEarningController());

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
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  "My Earning",
                  style: AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black, fontSize: 16.sp),
                ),
                const Text("Aboutus", style: TextStyle(color: Colors.transparent)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: Obx(
              () => RefreshIndicator(
                onRefresh: () async {
                  await AccountRepository().getEarningApiCall(isLoader: con.isLoader);
                },
                child: con.isLoader.value
                    ? const AppLoader()
                    : ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Row(
                            children: [
                              CustomEarningContainer(
                                title: con.myEarningData.value.wallet?.totalEarning.toString() ?? "",
                                subTitle: "Total Earning",
                                image: AppAssets.earningImg,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomEarningContainer(
                                title: con.myEarningData.value.wallet?.totalWithdrawn.toString() ?? "",
                                subTitle: "Total Withdraw",
                                image: AppAssets.totalWithdrawImg,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              CustomEarningContainer(
                                title: con.myEarningData.value.wallet?.pendingWithdraw.toString() ?? "",
                                subTitle: "Pending Withdraw",
                                image: AppAssets.penWithdrawImg,
                              ),
                              // SizedBox(
                              //   width: 4.w,
                              // ),
                              // Spacer()
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                border: Border.all(color: Theme.of(context).primaryColor, width: 2.w),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Withdrawal Records",
                                  style: TextStyle(fontSize: 14.sp, color: AppColors.black, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Date",
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "	Amount",
                                        // textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                ),
                                _paymentRecodeModule()
                              ],
                            ),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 10.w),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentRecodeModule() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: con.myEarningData.value.data?.length,
      itemBuilder: (BuildContext context, int index) {
        var item = con.myEarningData.value.data?[index];
        return Row(
          children: [
            Expanded(
              child: Text(
                DateFormat('dd MMM yyyy hh:mm').format(item?.createdAt ?? DateTime.now()),
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                "${item?.disbursementAmount ?? ""}",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 5.h);
      },
    );
  }
}
