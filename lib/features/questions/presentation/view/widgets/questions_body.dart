// TODO: presentation QuestionsBody
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/count_down_timer.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/multiple_choice_container.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/question_stepper.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/singe_choice_container.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/time_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsBody extends StatelessWidget {
  const QuestionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.chevron_left_outlined, size: 36.sp),

                    Text(
                      LocaleKeys.questions_exam.tr(),
                      style: Styles.medium(context, 20.sp),
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
                CountdownTimer(
                  onFinished: () {
                    // showDialog(
                    //   barrierDismissible: false,
                    //   context: context,
                    //   builder: (context) {
                    //     return TimeOutDialog();
                    //   },
                    // );
                    print("FINISED");
                  },
                  totalMinutes: 25,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            QuestionStepper(currentQuestion: 5, totalQuestions: 20),
            SizedBox(height: 8.h),
            Text(
              "Select the correctly punctuated sentence.",
              style: Styles.medium(context, 18.sp),
            ),
            SizedBox(height: 24.h),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SingeChoiCeContainer(
                  isSelected: index == 0,
                  text: "Its going to rain today.",
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
