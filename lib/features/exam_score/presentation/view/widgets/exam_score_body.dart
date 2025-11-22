// TODO: presentation Exam_scoreBody

import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/exam_score/presentation/view/widgets/animated_score_indicator.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExamScoreBody extends StatefulWidget {
  final ExamEntity exam;
  const ExamScoreBody({super.key, required this.exam});

  @override
  State<ExamScoreBody> createState() => _ExamScoreBodyState();
}

class _ExamScoreBodyState extends State<ExamScoreBody> {
  int correctAnswers = 0;
  int wrongAnswers = 0;
  double correctRatio = 0;
  @override
  void initState() {
    for (var question in widget.exam.questions) {
      if (question.answeredQuestion == question.correctAnswer) {
        correctAnswers++;
      } else {
        wrongAnswers++;
      }
      print("Question ID: ${question.id}");
    }

    correctRatio = correctAnswers / widget.exam.questions.length;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                SizedBox(
                  width: 130.w,
                  height: 130.w,
                  child: AnimatedScoreIndicator(correctRatio: correctRatio),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              LocaleKeys.exam_score_correct_answers.tr(),
                              style: Styles.medium(
                                context,
                                16.sp,
                                color: AppColors.prime,
                              ),
                            ),
                          ),
                          Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: AppColors.prime,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                correctAnswers.toString(),
                                style: Styles.medium(
                                  context,
                                  12,
                                  color: AppColors.prime,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              LocaleKeys.exam_score_wrong_answers.tr(),
                              style: Styles.medium(
                                context,
                                16.sp,
                                color: AppColors.errorDark,
                              ),
                            ),
                          ),
                          Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: AppColors.errorDark,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                wrongAnswers.toString(),
                                style: Styles.medium(
                                  context,
                                  12,
                                  color: AppColors.errorDark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                context.pop();
                context.pop();
                context.push(Routes.answers, extra: widget.exam.questions);
              },
              backGroundColor: AppColors.prime,
              title: LocaleKeys.exam_score_show_results.tr(),
              titleStyle: Styles.medium(context, 16.sp, color: AppColors.white),
            ),
            SizedBox(height: 24.h),
            CustomButton(
              onTap: () {
                context.pop("startAgain");
              },
              backGroundColor: Colors.transparent,
              elevation: 0,
              borderColor: AppColors.prime,
              title: LocaleKeys.exam_score_start_again.tr(),
              titleStyle: Styles.medium(context, 16.sp, color: AppColors.prime),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
