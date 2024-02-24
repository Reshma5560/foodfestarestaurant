import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_style.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final bool isLeadingShow;
  final void Function()? onPressed;

  const CommonAppBar({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLeadingShow = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: isLeadingShow
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.black,
              ),
              onPressed: onPressed,
            )
          : null,
      title: Text(
        title,
        style:
            AppStyle.customAppBarTitleStyle().copyWith(color: AppColors.black),
      ),
    );
  }
}
