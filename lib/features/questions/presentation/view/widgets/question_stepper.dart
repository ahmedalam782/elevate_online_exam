import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionStepper extends StatelessWidget {
  final int totalQuestions;
  final int currentQuestion;
  const QuestionStepper({
    super.key,
    required this.totalQuestions,
    required this.currentQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${LocaleKeys.questions_question.tr()} ${currentQuestion} ${LocaleKeys.questions_of.tr()} ${totalQuestions}",
              style: Styles.medium(context, 14.sp, color: AppColors.gray53),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        SizedBox(
          width: 1.sw,
          height: 3.h,
          child: Stack(
            children: [
              Container(
                width: 1.sw,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.grayCF,
                  borderRadius: BorderRadius.circular(1000.r),
                ),
              ),
              Container(
                width: (currentQuestion / totalQuestions) * 1.sw,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.prime,
                  borderRadius: BorderRadius.circular(1000.r),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
