import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/styles.dart';

class BuildAppTitle extends StatelessWidget {
  const BuildAppTitle({
    super.key,
    required this.textController,
    required this.textSlideAnimation,
    required this.textOpacityAnimation,
  });
  final AnimationController textController;
  final Animation<double> textSlideAnimation;
  final Animation<double> textOpacityAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, textSlideAnimation.value),
          child: Opacity(
            opacity: textOpacityAnimation.value,
            child: Text(
              LocaleKeys.global_online_exam.tr(),
              style: Styles.bold(context, 32, color: AppColors.white).copyWith(
                shadows: [
                  Shadow(
                    color: AppColors.black.withValues(alpha: 0.3),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
