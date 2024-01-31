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
      body: Obx(() => IndexedStack(
            index: indexScreenController.selectedIndex.value,
            children: indexScreenController.pages,
          )),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Obx(
          () => indexScreenController.isLoading.value
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(color: Colors.transparent),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0.0, 1.0), //(x,y)
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                  ), // decoration class
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      type: BottomNavigationBarType.fixed,
                      selectedLabelStyle: const TextStyle(
                        fontSize: 10,
                        // color: finalPrimaryColor,
                      ),
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            AppAssets.homeIcon,
                            height: 18.w,
                            color:
                                indexScreenController.selectedIndex.value == 0
                                    ? Theme.of(context).primaryColor
                                    : AppColors.black.withOpacity(0.4),
                          ),
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            AppAssets.categoryIcon,
                            height: 18.w,
                            color:
                                indexScreenController.selectedIndex.value == 1
                                    ? Theme.of(context).primaryColor
                                    : AppColors.black.withOpacity(0.4),
                          ),
                          label: "Category",
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            AppAssets.profileIcon,
                            color:
                                indexScreenController.selectedIndex.value == 4
                                    ? Theme.of(context).primaryColor
                                    : AppColors.black.withOpacity(0.4),
                            height: 18.w,
                          ),
                          label: "Profile",
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
    );
  }
}
