import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import 'build_app_title.dart';
import 'build_loading_text.dart';
import 'build_logo_section.dart';
import 'build_particle_background.dart';
import 'build_progress_indicator.dart';
import 'build_subtitle.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
    required this.logoController,
    required this.textController,
    required this.progressController,
    required this.particleController,
    required this.logoScaleAnimation,
    required this.logoOpacityAnimation,
    required this.textOpacityAnimation,
    required this.textSlideAnimation,
    required this.progressAnimation,
    required this.particleAnimation,
  });
  final AnimationController logoController;
  final AnimationController textController;
  final AnimationController progressController;
  final AnimationController particleController;

  final Animation<double> logoScaleAnimation;
  final Animation<double> logoOpacityAnimation;
  final Animation<double> textOpacityAnimation;
  final Animation<double> textSlideAnimation;
  final Animation<double> progressAnimation;
  final Animation<double> particleAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryLight,
      child: Stack(
        children: [
          // Animated particles background
          BuildParticleBackground(particleAnimation: particleAnimation),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo section
                BuildLogoSection(
                  logoAnimation: logoController,
                  logoScaleAnimation: logoScaleAnimation,
                  logoOpacityAnimation: logoOpacityAnimation,
                ),
                SizedBox(height: 40.h),

                // App title
                BuildAppTitle(
                  textController: textController,
                  textSlideAnimation: textSlideAnimation,
                  textOpacityAnimation: textOpacityAnimation,
                ),

                SizedBox(height: 20.h),

                // Subtitle
                BuildSubtitle(
                  textController: textController,
                  textSlideAnimation: textSlideAnimation,
                  textOpacityAnimation: textOpacityAnimation,
                ),

                SizedBox(height: 60.h),

                // Progress indicator
                BuildProgressIndicator(progressAnimation: progressAnimation),
              ],
            ),
          ),

          // Bottom loading text
          Positioned(
            bottom: 100.h,
            left: 0,
            right: 0,
            child: BuildLoadingText(
              textController: textController,
              textOpacityAnimation: textOpacityAnimation,
            ),
          ),
        ],
      ),
    );
  }
}
