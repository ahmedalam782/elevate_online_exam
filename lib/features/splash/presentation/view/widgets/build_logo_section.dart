import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/theme/app_animations.dart';


class BuildLogoSection extends StatelessWidget {
  const BuildLogoSection({
    super.key,
    required this.logoAnimation,
    required this.logoScaleAnimation,
    required this.logoOpacityAnimation,
  });
  final Animation<double> logoAnimation;
  final Animation<double> logoScaleAnimation;
  final Animation<double> logoOpacityAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: logoAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: logoScaleAnimation.value,
          child: Opacity(
            opacity: logoOpacityAnimation.value,
            child: Center(
              child: Lottie.asset(
               AppAnimations.animationsExams,
                width: 100.w,
                height: 100.w,
                fit: BoxFit.contain,
                repeat: true,
                animate: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
