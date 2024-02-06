import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowModule extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextStyle? customTextStyle;
  const RowModule({super.key, this.title, this.subTitle, this.customTextStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title ?? "",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
          ),
        ),
        Expanded(
          child: Text(
            subTitle ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: customTextStyle ??
                TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
