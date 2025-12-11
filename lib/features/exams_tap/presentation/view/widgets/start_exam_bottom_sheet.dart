import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/app_images.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/explore/domain/entities/subject_entities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartExamBottomSheet extends StatelessWidget {
  const StartExamBottomSheet({super.key, required this.exam, this.subject});
  final ExamEntity exam;
  final SubjectEntities? subject;

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
                    AppImages.profitImage,
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
              title: LocaleKeys.exams_tap_start_exam.tr(),
              onTap: () => {
                context.push(
                  Routes.questions,
                  extra: {"exam": exam, "subject": subject},
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
