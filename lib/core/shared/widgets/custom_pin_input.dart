import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../theme/app_colors.dart';
import '../../theme/styles.dart';

class CustomPinInput extends StatelessWidget {
  const CustomPinInput({
    super.key,
    this.validator,
    this.onCompleted,
    this.onSubmitted,
    this.closeKeyboardWhenCompleted = false,
    this.controller,
    this.isEnabled = true,
    this.onChange,
    this.length = 4,
  });
  final String? Function(String? value)? validator;
  final void Function(String value)? onCompleted;
  final void Function(String value)? onSubmitted;
  final void Function(String value)? onChange;
  final bool closeKeyboardWhenCompleted, isEnabled;
  final TextEditingController? controller;
  final int? length;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        enabled: isEnabled,
        length: length!,
        enableSuggestions: true,
        crossAxisAlignment: CrossAxisAlignment.center,
        cursor: Container(
          width: 1.5,
          height: 25,
          decoration: const BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(99999),
              top: Radius.circular(99999),
            ),
          ),
        ),
        pinContentAlignment: Alignment.center,
        controller: controller,
        defaultPinTheme: defaultPinTheme(context),
        focusedPinTheme: focusedPinTheme(context),
        submittedPinTheme: submittedPinTheme(context),
        errorPinTheme: errorPinTheme(context),
        validator: validator,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onCompleted: onCompleted,
        onSubmitted: onSubmitted,
        onChanged: onChange,
        animationCurve: Curves.bounceInOut,
        animationDuration: const Duration(milliseconds: 300),
        closeKeyboardWhenCompleted: closeKeyboardWhenCompleted,
        isCursorAnimationEnabled: true,
        keyboardType: TextInputType.number,
      ),
    );
  }

  static PinTheme defaultPinTheme(BuildContext context) => PinTheme(
    width: 48,
    height: 48,
    textStyle: Styles.semiBold(
      context,
      24,
    ).copyWith(color: AppColors.primaryLight),
    decoration: BoxDecoration(
      color: AppColors.grayCF,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withValues(alpha: 0.05),
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(0, 1),
        ),
      ],
    ),
  );
  static PinTheme focusedPinTheme(BuildContext context) =>
      defaultPinTheme(context).copyWith(
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          border: Border.all(color: AppColors.primaryLight, width: 2),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      );
  static PinTheme submittedPinTheme(BuildContext context) =>
      defaultPinTheme(context).copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryLight, width: 1),
          color: AppColors.primaryLight,

          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      );
  static PinTheme errorPinTheme(BuildContext context) =>
      defaultPinTheme(context).copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.errorLight, width: 2),
          color: AppColors.errorLight.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      );
}
