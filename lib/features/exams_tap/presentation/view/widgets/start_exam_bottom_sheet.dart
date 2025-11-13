import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:flutter/material.dart';

class StartExamBottomSheet extends StatelessWidget {
  const StartExamBottomSheet({super.key, required this.exam});
  final ExamEntity exam;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets, // for keyboard
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // shrink to content
          children: [
            Row(
              spacing: 8,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    'assets/images/profit.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exam.title, style: Styles.semiBold(context, 20)),
                    Text(
                      "${exam.numberOfQuestions} Questions",
                      style: Styles.regular(
                        context,
                        16,
                        color: AppColors.gray53,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  '${exam.duration} min',
                  style: Styles.regular(context, 13, color: AppColors.blue02),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomButton(
              title: 'Start Exam',
              onTap: () => {Navigator.pop(context)},
            ),
          ],
        ),
      ),
    );
  }
}
