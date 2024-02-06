// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:get/get.dart';


class ForwardArrowRowModule extends StatelessWidget {
  final String labelText;
  void Function()? onTap;
  final Widget? child;
  final bool suffixIconShow;
  ForwardArrowRowModule(
      {Key? key,
      required this.labelText,
      required this.onTap,
      this.child,
      this.suffixIconShow = true,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Column(
          children: [
            Container(
              // color: isopen?AppColors.purpleTextFiledColor:AppColors.greyColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    labelText,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.blackColor,fontWeight: FontWeight.bold
                    ),
                  ),
                  suffixIconShow == false
                      ? Container()
                      : Icon(
                           Icons.keyboard_arrow_right,
                          size: 20,
                          color: AppColors.blackColor,
                        ),
                ],
              ).paddingSymmetric(horizontal: 10, vertical: 12),
            ),
            child != null ? child! : Container()
          ],
        ),
      ).paddingOnly(bottom: 10),
    );
  }
}
