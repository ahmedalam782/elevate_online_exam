import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/styles.dart';

class BuildSubtitle extends StatelessWidget {
  const BuildSubtitle({
    super.key,
    required this.textController,
    required this.textSlideAnimation,
    required this.textOpacityAnimation,
  });
  final Animation<double> textController;
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
              LocaleKeys.global_test_your_knowledge.tr(),
              style: Styles.regular(
                context,
                16,
                color: AppColors.white.withValues(alpha: 0.9),
              ),
            ),
          ),
        );
      },
    );
  }
}
