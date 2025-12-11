import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../languages/locale_keys.g.dart';
import '../../theme/app_colors.dart';
import '../../theme/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.leading,
    this.backGroundColor = AppColors.primaryLight,
    this.isFilled = true,
    this.borderColor,
    this.titleStyle,
    this.width,
    this.height,
    this.isLoading = false,
    this.elevation,
    this.radius,
    this.isExpanded = true,
    this.padding,
    this.gradient = AppColors.primaryGradient,
    this.isGradient = false,
    this.hideTitle = false,
    this.icon,
  });
  final void Function()? onTap;
  final String? title, icon;
  final Widget? leading;
  final Color? backGroundColor, borderColor;
  final bool isFilled, isLoading, isExpanded, isGradient, hideTitle;
  final double? width, height, elevation, radius;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final LinearGradient? gradient;
  @override
  Widget build(BuildContext context) {
    final borderRadiusValue = radius ?? 400.r;
    final borderRadius = BorderRadius.circular(borderRadiusValue);
    final buttonWidth = isExpanded
        ? (hideTitle
              ? 50.0 // Ensure consistent animation by using double values
              : isLoading
              ? 220.0
              : width ?? 1.sw)
        : null;
    final buttonHeight = height ?? 50;
    final button = ElevatedButton(
      onPressed: isLoading ? () {} : onTap,
      style: ElevatedButton.styleFrom(
        padding: padding,
        splashFactory: NoSplash.splashFactory,
        disabledBackgroundColor: AppColors.gray87,
        backgroundColor: (isGradient && gradient != null) || (!isFilled)
            ? Colors.transparent
            : (isFilled
                  ? backGroundColor
                  : AppColors.black1D.withValues(alpha: 0.12)),
        overlayColor: !isGradient
            ? isFilled && backGroundColor != Colors.transparent
                  ? AppColors.primaryLight
                  : backGroundColor != Colors.transparent
                  ? backGroundColor
                  : borderColor
            : null,
        side: isFilled && borderColor == null
            ? null
            : BorderSide(width: 1, color: borderColor ?? Colors.transparent),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        shadowColor: elevation != null
            ? elevation == 0
                  ? Colors.transparent
                  : AppColors.backgroundDark
            : null,
        elevation: elevation ?? (isFilled ? null : 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
        spacing: 8,
        children: [
          isLoading
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CupertinoActivityIndicator(color: AppColors.white),
                  ),
                )
              : icon != null
              ? SvgPicture.asset(
                  icon!,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    isFilled
                        ? AppColors.white
                        : backGroundColor ??
                              borderColor ??
                              AppColors.primaryLight,
                    BlendMode.srcIn,
                  ),
                )
              : leading ?? const SizedBox(),

          if (title != null && !hideTitle)
            Flexible(
              child: Text(
                isLoading ? LocaleKeys.custom_widget_loading.tr() : title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    titleStyle ??
                    Styles.regular(context, 14).copyWith(
                      color: isFilled
                          ? AppColors.white
                          : (backGroundColor != null &&
                                backGroundColor != Colors.transparent)
                          ? backGroundColor
                          : (borderColor != null &&
                                borderColor != Colors.transparent)
                          ? borderColor
                          : AppColors.primaryLight,
                    ),
              ),
            ),
        ],
      ),
    );
    Widget result = button;
    if (isGradient && gradient != null) {
      result = AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: buttonWidth?.toDouble(),
        height: buttonHeight,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: borderRadius,
          child: result,
        ),
      );
    } else {
      result = AnimatedContainer(
        width: buttonWidth,
        height: buttonHeight,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutBack,
        child: result,
      );
    }
    return Center(child: result);
  }
}
