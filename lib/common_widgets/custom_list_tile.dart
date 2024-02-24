import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;

  const CustomListTile(
      {super.key, required this.icon, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 2.h),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.white),
        child: Row(children: [
          Expanded(
              child: Text(title,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14))),
          Icon(
            Icons.arrow_right,
            size: 30.h,
            color: Theme.of(context).primaryColor,
          ),
        ]).paddingSymmetric(horizontal: 10.w, vertical: 2.h),
      ),
    );
  }
}
