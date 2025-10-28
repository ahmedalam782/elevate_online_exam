import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class BuildProgressIndicator extends StatelessWidget {
  const BuildProgressIndicator({super.key, required this.progressAnimation});
  final Animation<double> progressAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (context, child) {
        return Container(
          width: 200.w,
          height: 4.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r),
            color: AppColors.white.withValues(alpha: 0.2),
          ),
          child: Stack(
            children: [
              Container(
                width: 200.w * progressAnimation.value,
                height: 4.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  gradient: LinearGradient(
                    colors: [AppColors.white, AppColors.primeAccent],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
