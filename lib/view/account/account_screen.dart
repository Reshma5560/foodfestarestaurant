import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/common_widgets/custom_list_tile.dart';
import 'package:foodfestarestaurant/controller/account/account_controller.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:foodfestarestaurant/route/app_routes.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: defaultPadding.h,
          ),
          SizedBox(height: defaultPadding.h),
          _profileImageWidget(),
          const SizedBox(
            height: defaultPadding,
          ),
          Text("My Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor))
              .paddingSymmetric(horizontal: defaultPadding),
          const SizedBox(
            height: defaultPadding,
          ),
          _bodyWidget(),
        ],
      ),
    );
  }

  Widget _profileImageWidget() {
    return Column(children: [
      Stack(
        children: [
          Positioned(
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(200),
                ),
                child: profileController.getDataMap?.data.image != null
                    ? Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              profileController.getDataMap?.data.image ?? "",
                            ),
                            onError: (exception, stackTrace) =>
                                // Image.asset(AppImages.appLogoImage),
                                Image.network(
                                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: const NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'), //userProfileImage),
                              fit: BoxFit.cover,
                              onError: (exception, stackTrace) =>
                                  // Image.asset(AppImages.appLogoImage),
                                  Image.network(
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      // Text("${profileController.getDataMap?.data.firstName} ${profileController.getDataMap?.data.lastName}",
      //     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      // Text("+91 ${profileController.getDataMap?.data.phone}",
      //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.greyFontColor))
    ]);
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        CustomListTile(
          icon: Icons.account_circle,
          title: 'Edit Account',
          onPressed: () {
            Get.toNamed(AppRoutes.editAccountScreen);
          },
        ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // CustomListTile(
        //   icon: Icons.location_on,
        //   title: 'Manage Address',
        //   onPressed: () {
        //     Get.toNamed(AppRoutes.manageAddressScreen);
        //   },
        // ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // CustomListTile(
        //   icon: Icons.favorite,
        //   title: 'Favorite',
        //   onPressed: () {
        //     Get.toNamed(AppRoutes.wishListScreen);
        //   },
        // ),
        Divider(
          color: AppColors.grey,
        ),
        CustomListTile(
          icon: Icons.password,
          title: 'Change password',
          onPressed: () {
            Get.toNamed(AppRoutes.updatePasswordScreen);
          },
        ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // const CustomListTile(
        //   icon: Icons.percent,
        //   title: 'Offer',
        // ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // CustomListTile(
        //   icon: Icons.contact_support_sharp,
        //   title: 'Contact Us',
        //   onPressed: () {
        //     Get.toNamed(AppRoutes.contactUsScreen);
        //   },
        // ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // CustomListTile(
        //   icon: Icons.info,
        //   title: 'About Us',
        //   onPressed: () {
        //     Get.toNamed(AppRoutes.aboutUsScreen);
        //   },
        // ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // CustomListTile(
        //   icon: Icons.help_outline_sharp,
        //   title: 'Faqs',
        //   onPressed: () {
        //     Get.toNamed(AppRoutes.termsConditionsScreen);
        //   },
        // ),
        // Divider(
        //   color: AppColors.grey,
        // ),
        // const CustomListTile(
        //   icon: Icons.settings,
        //   title: 'Setting',
        // ),
      ],
    );
  }
}
