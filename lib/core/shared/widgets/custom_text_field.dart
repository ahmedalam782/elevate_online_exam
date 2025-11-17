import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.maxLine,
    this.isDense = false,
    this.validator,
    this.controller,
    this.enableFocusBorder = true,
    this.textInputType,
    this.suffixText,
    this.suffixTextStyle,
    this.labelText,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.prefixWidget,
    this.suffixWidget,
    this.textStyle,
    this.enableFill = true,
    this.fillColor,
    this.title,
    this.isObscureText = false,
    this.titleStyle,
    this.focusBorderColor,
    this.floatingLabelBehavior,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.isReadOnly = false,
    this.spacing = 0,
    this.initialValue,
    this.inputFormatters,
    this.contentPadding,
    this.maxLength,
    this.textAlign,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.onSaved,
    this.hintStyle,
    this.hintText,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.textDirection,
    this.disabledBorder,
    this.textCapitalization,
    this.prefixIcon,
    this.labelWidget,
    this.errorBorder,
    this.autovalidateMode,
    this.errorMaxlines,
  });
  final int? errorMaxlines;
  final String? labelText;
  final Widget? labelWidget;
  final double? borderRadius;
  final TextAlign? textAlign;
  final String? Function(String? value)? validator;
  final double? borderWidth;
  final Color? borderColor;
  final Color? fillColor;
  final bool enableFill;
  final Widget? suffixWidget;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final Widget? prefixWidget;
  final String? prefixIcon;
  final int? maxLine;
  final double? spacing;
  final TextInputType? textInputType;
  final bool enableFocusBorder;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? title;
  final TextStyle? hintStyle;
  final String? hintText;
  final TextStyle? titleStyle;
  final bool isObscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? focusBorderColor;
  final FocusNode? focusNode;
  final String? initialValue;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final bool isReadOnly;
  final EdgeInsetsDirectional? contentPadding;
  final int? maxLength;
  final bool isDense;
  final InputBorder? border;
  final TextCapitalization? textCapitalization;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final TextDirection? textDirection;
  // added error border if needed
  final InputBorder? errorBorder;
  // adding autovalidate mode only if needed not on every case
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (title != null && title!.isNotEmpty)
          Text(
            title ?? "",
            style: Styles.light(
              context,
              14,
            ).copyWith(color: AppColors.backgroundDark),
          ),
        TextFormField(
          enabled: !isReadOnly,
          textDirection: textDirection,
          obscuringCharacter: "*",
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          // changing the autovalidateMode to be disabled by default and enable it if needed
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          onSaved: onSaved,
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          onChanged: onChanged,
          onTapOutside: (pos) {
            FocusScope.of(context).unfocus();
          },
          autofocus: false,
          maxLength: maxLength,
          readOnly: isReadOnly,
          obscureText: isObscureText,
          validator: validator,
          focusNode: focusNode,
          textInputAction: textInputAction,
          initialValue: initialValue,
          controller: controller,
          maxLines: maxLine ?? 1,
          textAlign: textAlign ?? TextAlign.start,
          keyboardType: textInputType,
          inputFormatters: textInputType == TextInputType.phone
              ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))]
              : textInputType == TextInputType.number
              ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
              : inputFormatters,
          cursorColor: AppColors.primaryLight,
          style: textStyle ?? Styles.regular(context, 16),
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            fillColor: !isReadOnly ? fillColor : AppColors.backgroundLight,
            filled: enableFill,
            isDense: isDense,
            hintText: hintText,
            hintTextDirection: textDirection,
            hoverColor: AppColors.primaryDark,
            hintStyle:
                hintStyle ??
                Styles.light(context, 14).copyWith(
                  color: !isReadOnly ? AppColors.gray5F : AppColors.grayA6,
                ),
            contentPadding:
                contentPadding ??
                REdgeInsetsDirectional.only(
                  start: 16,
                  end: 16,
                  bottom: 12,
                  top: 12,
                ),
            alignLabelWithHint: true,
            errorStyle: Styles.regular(
              context,
              12,
              color: AppColors.onErrorLight,
            ),
            focusColor: focusBorderColor ?? AppColors.primaryLight,
            suffixIcon: suffixWidget,
            suffixText: suffixText,
            suffixStyle: suffixTextStyle,
            prefixIcon: prefixIcon != null
                ? SvgPicture.asset(
                    prefixIcon!,
                    width: 20,
                    height: 20,
                    fit: BoxFit.scaleDown,
                    colorFilter: const ColorFilter.mode(
                      AppColors.gray5F,
                      BlendMode.srcIn,
                    ),
                  )
                : prefixWidget,
            errorMaxLines: errorMaxlines ?? 2,
            label:
                labelWidget ??
                Text(labelText ?? "", style: Styles.regular(context, 14)),
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            errorBorder:
                // use errorBorder instead of enabledBorder
                errorBorder ??
                // editing the defult error border to be the same as the design in figma
                customOutLineBorders(
                  borderColor: AppColors.onErrorLight,
                  borderRadius: borderRadius,
                  borderWidth: borderWidth,
                ),
            disabledBorder:
                disabledBorder ??
                customOutLineBorders(
                  borderRadius: borderRadius,
                  borderWidth: borderWidth,
                ),
            border:
                border ??
                customOutLineBorders(
                  borderRadius: borderRadius,
                  borderWidth: borderWidth,
                ),
            enabledBorder:
                enabledBorder ??
                customOutLineBorders(
                  borderRadius: borderRadius,
                  borderWidth: borderWidth,
                ),
            focusedBorder:
                focusedBorder ??
                customOutLineBorders(
                  borderRadius: borderRadius,
                  borderColor: enableFocusBorder
                      ? AppColors.primaryLight
                      : null,
                  borderWidth: 1.5,
                ),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder customOutLineBorders({
  double? borderRadius,
  Color? borderColor,
  double? borderWidth,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 4),
    borderSide: BorderSide(
      color: borderColor ?? AppColors.gray53,
      width: borderWidth ?? 1,
    ),
  );
}
