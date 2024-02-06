// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:foodfestarestaurant/res/app_button.dart';
// import 'package:foodfestarestaurant/res/app_colors.dart';
// import 'package:foodfestarestaurant/res/app_text_field.dart';
// import 'package:get/get.dart';

// class CustomAddAddonsDialog extends StatelessWidget {
//   String? text;
//   // String content;
//   // String yesButtonText;
//   // String noButtonText;
//   // Function() onYesPressed;
//   // Function() onNoPressed;
//   Color? bgColor;
//   // Color? activeColor;
//   EdgeInsetsGeometry? titlePadding;
//   EdgeInsetsGeometry? contentPadding;

//   CustomAddAddonsDialog({
//     Key? key,
//     this.text,
//     //  this.content,
//     //  this.onYesPressed,
//     //  this.onNoPressed,
//     //  this.yesButtonText,
//     //  this.noButtonText,
//     this.bgColor,
//     this.titlePadding,
//     this.contentPadding,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//       ),
//       titlePadding: titlePadding,
//       title: Text(
//         text ?? "",
//         style: TextStyle(
//           // fontFamily: FontFamilyText.sFProDisplayRegular,
//           color: AppColors.blackColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       contentPadding: contentPadding,
//       content: const Column(
//         children: [AppTextField(), AppTextField()],
//       ),
//       actions: [
//         const Divider(thickness: 1),
//         Row(
//           children: [
//             Expanded(
//               child: AppButton(
//                 child: Text("Save"),
//                 // text: yesButtonText,
//                 // onTap: onYesPressed,
//                 // fontWeight: FontWeight.bold,
//                 // textsize: 13.sp,
//                 // textColor: AppColors.white,
//                 backgroundColor: bgColor, onPressed: () {},
//               ),
//             ),
//             const SizedBox(width: 15),
//             Expanded(
//               child: AppButton(
//                 child: Text("Cancel"),
//                 // text: noButtonText,
//                 // onTap: onNoPressed,
//                 // fontWeight: FontWeight.bold,
//                 // textsize: 13.sp,
//                 // textColor: AppColors.white,
//                 backgroundColor: bgColor,
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
