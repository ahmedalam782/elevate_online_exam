import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TimeOutDialog extends StatelessWidget {
  final ExamEntity examEntity;
  const TimeOutDialog({super.key, required this.examEntity});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // You can later add the hourglass image here
              const SizedBox(height: 12),
              Text(
                LocaleKeys.questions_time_out.tr(),
                style: TextStyle(
                  color: Color(0xFFCC1010), // red
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: LocaleKeys.questions_view_score.tr(),
                  backGroundColor: AppColors.primaryLight,
                  titleStyle: Styles.medium(
                    context,
                    16.sp,
                    color: AppColors.white,
                  ),
                  onTap: () {
                    // viewModel.doIntent(SaveExamEvent(exam: examEntity));
                    Navigator.of(context).pop();
                    context.push(Routes.examScore, extra: examEntity);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
