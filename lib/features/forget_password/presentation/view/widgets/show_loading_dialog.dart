import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import '../../../../../core/theme/app_animations.dart';

void showDialogLoading(
  BuildContext context, {
  bool barrierDismissible = false,
}) async {
  await showGeneralDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) =>
        ShowDialogLoading(),
    transitionBuilder: (context, anim1, anim2, child) {
      return Transform.scale(
        scale: anim1.value,
        child: Opacity(opacity: anim1.value, child: child),
      );
    },
  );
}

class ShowDialogLoading extends StatelessWidget {
  const ShowDialogLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: Lottie.asset(AppAnimations.animationsLoadingAnimationBlue),
    );
  }
}
