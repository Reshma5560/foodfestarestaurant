import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';

class CustomEarningContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const CustomEarningContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Image.asset(
            image,
            height: 25.w,
          ),
        ],
      ),
    ));
  }
}
