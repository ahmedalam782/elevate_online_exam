import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceDecoratedContainer extends StatelessWidget {
  final bool isSelected;
  final Widget child;

  const ChoiceDecoratedContainer({
    super.key,
    required this.isSelected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: isSelected ? AppColors.secondaryLight : AppColors.surfaceLight,
      ),
      child: child,
    );
  }
}
