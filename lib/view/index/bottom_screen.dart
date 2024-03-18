import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/controller/bottom_controller.dart';
import 'package:foodfestarestaurant/res/app_assets.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:get/get.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});

  final indexScreenController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IndexedStack(
              index: indexScreenController.selectedIndex.value,
              children: indexScreenController.pages,
            ),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: Obx(
                () => indexScreenController.isLoading.value
                    ? Container()
                    : Container(
                        height: 40.h,
                        margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),

                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          border: Border.all(color: Colors.transparent),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 3.0,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30.0),
                        ), // decoration class
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.r),
                          child: BottomNavigationBar(
                            backgroundColor: Theme.of(context).colorScheme.background,
                            type: BottomNavigationBarType.fixed,
                            selectedLabelStyle: TextStyle(
                              fontSize: 8.sp,
                            ),
                            selectedItemColor: Theme.of(context).primaryColor,
                            showSelectedLabels: true,
                            showUnselectedLabels: false,
                            items: <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  AppAssets.homeIcon,
                                  height: 14..h,
                                  color:
                                      indexScreenController.selectedIndex.value == 0 ? Theme.of(context).primaryColor : AppColors.unselectedIconColor,
                                ),
                                label: "Home",
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  AppAssets.orderIcon,
                                  height: 14.h,
                                  color:
                                      indexScreenController.selectedIndex.value == 1 ? Theme.of(context).primaryColor : AppColors.unselectedIconColor,
                                ),
                                label: "Order",
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  AppAssets.profileIcon,
                                  color:
                                      indexScreenController.selectedIndex.value == 2 ? Theme.of(context).primaryColor : AppColors.unselectedIconColor,
                                  height: 14.h,
                                ),
                                label: "Profile",
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  AppAssets.settingIcon,
                                  color:
                                      indexScreenController.selectedIndex.value == 3 ? Theme.of(context).primaryColor : AppColors.unselectedIconColor,
                                  height: 14.h,
                                ),
                                label: "Setting",
                              ),
                            ],
                            currentIndex: indexScreenController.selectedIndex.value,
                            onTap: (value) {
                              indexScreenController.changeIndex(value);
                            },
                          ),
                        ),
                      ).paddingSymmetric(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
