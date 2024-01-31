
import 'package:flutter/material.dart';
import 'package:foodfestarestaurant/res/app_colors.dart';
import 'package:foodfestarestaurant/res/app_style.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;

  const CustomListTile({super.key, required this.icon, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(children: [
        Icon(
          icon,
          size: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
        Icon(
          Icons.arrow_forward_ios,
          size: defaultPadding,
          color: AppColors.greyFontColor,
        ),
      ]).paddingSymmetric(horizontal: defaultPadding, vertical: 4),
    );
  }
}
