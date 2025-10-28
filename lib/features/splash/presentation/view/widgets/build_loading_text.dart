import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/styles.dart';

class BuildLoadingText extends StatelessWidget {
  const BuildLoadingText({
    super.key,
    required this.textController,
    required this.textOpacityAnimation,
  });
  final AnimationController textController;
  final Animation<double> textOpacityAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textController,
      builder: (context, child) {
        return Opacity(
          opacity: textOpacityAnimation.value,
          child: Center(
            child: Text(
              LocaleKeys.custom_widget_loading.tr(),
              style: Styles.regular(
                context,
                14,
                color: AppColors.white.withValues(alpha: 0.7),
              ),
            ),
          ),
        );
      },
    );
  }
}
