import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import 'app_loader.dart';
import 'app_style.dart';

enum ButtonType { elevated, gradient, outline }

class AppButton extends StatefulWidget {
  final ButtonType? buttonType;
  final String? title;
  final TextStyle? titleStyle;
  final double? width;
  final IconData? icon;
  final Color? loaderColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Gradient? gradient;
  final String? image;
  final double? height;
  final double? fontSize;
  final Widget? child;
  final double borderWidth;
  final bool? disableButton;
  final bool? loader;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  final Function(bool)? onHighlightChanged;

  const AppButton({
    super.key,
    this.title,
    this.titleStyle,
    this.buttonType = ButtonType.elevated,
    this.width,
    this.icon,
    this.loaderColor,
    this.backgroundColor,
    this.borderColor,
    this.gradient,
    this.image,
    this.height,
    this.fontSize,
    this.child,
    this.borderWidth = 1,
    this.disableButton = false,
    this.loader = false,
    this.borderRadius,
    required this.onPressed,
    this.onLongPress,
    this.padding,
    this.onHighlightChanged,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  RxBool buttonPress = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1200),
        curve: Curves.elasticOut,
        tween: widget.loader == true || buttonPress.value == true
            ? Tween(begin: 0.9, end: 0.97)
            : Tween(begin: 1.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.width?.w ?? Get.width,
              height: widget.height?.w ?? 46.w,
              margin: widget.padding ?? EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius:
                    widget.borderRadius ?? BorderRadius.circular(defaultRadius),
                color: widget.backgroundColor ??
                    (widget.buttonType == ButtonType.outline
                        ? null
                        : Theme.of(context)
                            .primaryColor
                            .withOpacity(withMyOpacity)),
                border: widget.buttonType == ButtonType.outline
                    ? Border.all(
                        color: widget.borderColor ??
                            Theme.of(context)
                                .primaryColor
                                .withOpacity(disableOpacity),
                        width: widget.borderWidth)
                    : null,
                gradient: loadingOrDisableStatus
                    ? (widget.buttonType == ButtonType.gradient
                        ? (widget.gradient ??
                            LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Theme.of(context).primaryColor.withOpacity(.2),
                                Theme.of(context).primaryColor,
                                Theme.of(context).primaryColor,
                                Theme.of(context).primaryColor.withOpacity(.2),
                              ],
                            ))
                        : null)
                    : null,
              ),
              child: RawMaterialButton(
                splashColor: Theme.of(context)
                    .scaffoldBackgroundColor
                    .withOpacity(widget.loader == false ? .1 : 0),
                highlightColor: Theme.of(context).primaryColor.withOpacity(
                    widget.buttonType == ButtonType.outline ? .1 : .0),
                shape: RoundedRectangleBorder(
                    borderRadius: widget.borderRadius ??
                        BorderRadius.circular(defaultRadius)),
                hoverElevation: widget.loader == false ? 4.0 : 0.0,
                elevation: widget.loader == false ? 2.0 : 0.0,
                disabledElevation: 0,
                highlightElevation: widget.loader == false ? 8.0 : 0.0,
                onPressed: loadingOrDisableStatus ? widget.onPressed : null,
                onLongPress: loadingOrDisableStatus ? widget.onLongPress : null,
                onHighlightChanged: loadingOrDisableStatus
                    ? (press) {
                        setState(
                          () {
                            buttonPress.value = press;
                            widget.onHighlightChanged != null
                                ? widget.onHighlightChanged!(press)
                                : null;
                          },
                        );
                      }
                    : null,
                child: widget.loader == false
                    ? (widget.child ??
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //** Icon Widget */
                            if (!isValEmpty(widget.icon)) ...[
                              Icon(widget.icon, color: Colors.white, size: 24),
                              const SizedBox(width: 5),
                            ] else
                              const SizedBox(),

                            //** Image widget */
                            if (!isValEmpty(widget.image)) ...[
                              GetUtils.isVector(widget.image!)
                                  ? SvgPicture.asset(
                                      widget.image!,
                                      height: 22,
                                      alignment: Alignment.bottomLeft,
                                    )
                                  : Image.asset(
                                      widget.image!,
                                      height: 22,
                                      alignment: Alignment.bottomLeft,
                                    ),
                              const SizedBox(width: 5)
                            ] else
                              const SizedBox(),

                            //** Title Widget */
                            if (!isValEmpty(widget.title))
                              Text(
                                widget.title!,
                                textAlign: TextAlign.center,
                                style: widget.titleStyle
                                        ?.copyWith(color: titleColor) ??
                                    TextStyle(
                                      fontSize: 14.sp,
                                      color: titleColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                              )
                            else
                              const SizedBox(),
                          ],
                        ))
                    : CircularLoader(
                        color: widget.loaderColor ??
                            (widget.buttonType == ButtonType.outline
                                ? Theme.of(context).primaryColor.withOpacity(.7)
                                : null),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color? get titleColor {
    return widget.buttonType == ButtonType.outline
        ? Theme.of(context).primaryColor.withOpacity(disableOpacity)
        : Colors.white.withOpacity(disableOpacity);
  }

  bool get loadingOrDisableStatus {
    return widget.disableButton == false
        ? (widget.loader == false ? true : false)
        : false;
  }

  double get withMyOpacity {
    return widget.loader == false
        ? (widget.disableButton == true ? .2 : 1.0)
        : .4;
  }

  double get disableOpacity {
    return widget.disableButton == true ? (Get.isDarkMode ? .6 : .9) : 1;
  }
}


/* 
class AppButton extends StatefulWidget {
  final String? title;
  final double? width;
  final IconData? icon;
  final String? image;
  final double? height;
  final double? fontSize;
  final Widget? child;
  final bool? disableButton;
  final bool? loader;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  final Function(bool)? onHighlightChanged;

  const AppButton({
    super.key,
    this.title,
    this.width,
    this.icon,
    this.image,
    this.height,
    this.fontSize,
    this.child,
    this.disableButton,
    this.loader = false,
    required this.onPressed,
    this.onLongPress,
    this.padding,
    this.onHighlightChanged,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  RxBool buttonPress = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.elasticOut,
        tween: buttonPress.value ? Tween(begin: 0.9, end: 0.97) : Tween(begin: 1.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Container(
              width: widget.width ?? Get.width,
              height: widget.height ?? 50.w,
              margin: widget.padding ?? EdgeInsets.zero,
              child: RawMaterialButton(
                fillColor: Theme.of(context).primaryColor.withOpacity(widget.loader == false ? (widget.disableButton == true ? .2 : 1.0) : .4),
                splashColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(widget.loader == false ? .1 : 0),
                highlightColor: Theme.of(context).primaryColor.withOpacity(.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultRadius)),
                hoverElevation: widget.loader == false ? 4.0 : 0.0,
                elevation: widget.loader == false ? 2.0 : 0.0,
                disabledElevation: 0,
                highlightElevation: widget.loader == false ? 8.0 : 0.0,
                onPressed: widget.disableButton == true ? null : (widget.loader == false ? widget.onPressed : () {}),
                onLongPress: widget.disableButton == true ? null : widget.onLongPress,
                onHighlightChanged: widget.loader == false
                    ? (press) {
                        setState(() {
                          buttonPress.value = press;
                          widget.onHighlightChanged != null ? widget.onHighlightChanged!(press) : null;
                        });
                      }
                    : null,
                child: child ??
                    (widget.loader == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.icon != null)
                                Row(
                                  children: [Icon(widget.icon, color: Colors.white, size: 24), const SizedBox(width: 5)],
                                )
                              else
                                const SizedBox(),
                              if (widget.image != null && widget.image != "")
                                Row(
                                  children: [
                                    widget.image!.contains(".svg")
                                        ? SvgPicture.asset(
                                            widget.image!,
                                            height: 22,
                                            alignment: Alignment.bottomLeft,
                                          )
                                        : Image.asset(
                                            widget.image!,
                                            height: 22,
                                            color: Colors.white,
                                            alignment: Alignment.bottomLeft,
                                          ),
                                    const SizedBox(width: 5)
                                  ],
                                )
                              else
                                const SizedBox(),
                              if (!isValEmpty(widget.title))
                                Text(
                                  widget.title!,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.buttonTitleStyle(),
                                )
                              else
                                const SizedBox(),
                            ],
                          )
                        : const CircularLoader()),
              ),
            ),
          );
        },
      ),
    );
  }
}
 */
