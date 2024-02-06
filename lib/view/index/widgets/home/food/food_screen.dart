import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/home/components/food/food_controller.dart';
import 'package:foodfestarestaurant/res/app_appbar.dart';
import 'package:foodfestarestaurant/res/app_loader.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:get/get.dart';

class FoodScreen extends StatelessWidget {
  FoodScreen({super.key});

  final FoodController con = Get.put(FoodController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          onPressed: () {
            Get.toNamed(AppRoutes.addFoodScreen);
          },
          child: const Icon(Icons.add),
        ),
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
                      title: "Food",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                        child: Obx(
                      () => con.isLoading.isTrue
                          ? const AppLoader()
                          : GridView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, mainAxisExtent: 170),
                              itemCount: con
                                  .getOrderDataModel.value.data?.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = con
                                    .getOrderDataModel.value.data?.data?[index];
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.foodDetailsScreen,
                                        arguments: {'foodId': item?.id});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius:
                                            BorderRadius.circular(12.r)),
                                    child: Column(
                                      children: [
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                          child: Image.network(
                                            item?.image ?? "",
                                            height: 80.h,
                                            width: 90.w,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        //     Expanded(
                                        //         child: Icon(
                                        //             Icons.more_vert_outlined)),
                                        //   ],
                                        // ).paddingOnly(right: 4.w),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          item?.foodName ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        // Expanded(
                                        //   child: Column(
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.start,
                                        //     children: [

                                        //       Text(
                                        //         item?.description ?? "",
                                        //         maxLines: 2,
                                        //         overflow: TextOverflow.ellipsis,
                                        //         style: TextStyle(
                                        //             color:
                                        //                 AppColors.greyFontColor,
                                        //             fontSize: 10.sp,
                                        //             fontWeight: FontWeight.w400),
                                        //       ),
                                        //       Text(
                                        //         item?.categoryId ?? "",
                                        //         style: TextStyle(
                                        //             color: AppColors.black,
                                        //             fontSize: 15.sp,
                                        //             fontWeight: FontWeight.w600),
                                        //       ),
                                        //       Text(
                                        //         "₹${(item?.price ?? "")}",
                                        //         style: TextStyle(
                                        //             color: AppColors.black,
                                        //             fontSize: 15.sp,
                                        //             fontWeight: FontWeight.w600),
                                        //       ),
                                        //       Text(
                                        //         item?.veg == 1
                                        //             ? "Veg"
                                        //             : "Non Veg",
                                        //         style: TextStyle(
                                        //             color: AppColors.black,
                                        //             fontSize: 13.sp,
                                        //             fontWeight: FontWeight.w600),
                                        //       ),
                                        //       Row(
                                        //         children: [
                                        //           InkWell(
                                        //             onTap: () {
                                        //               Get.toNamed(AppRoutes.addFoodScreen);
                                        //             },
                                        //             child: Icon(
                                        //               Icons.edit,
                                        //               size: 18.sp,
                                        //             ),
                                        //           ),
                                        //           SizedBox(
                                        //             width: 6.w,
                                        //           ),
                                        //           Icon(
                                        //             Icons.delete,
                                        //             size: 18.sp,
                                        //           )
                                        //         ],
                                        //       )
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ).paddingSymmetric(vertical: 5.h),
                                  ),
                                );
                              },
                            ),
                    ))
                  ]));
            }));
  }
}
