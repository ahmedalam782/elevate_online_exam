import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/app_images.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyExamsWidget extends StatelessWidget {
  const EmptyExamsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200.h,
          width: 100.w,
          child: Image.asset(AppImages.profitImage, fit: BoxFit.contain),
        ),
        SizedBox(height: 20.h),
        Text(
          LocaleKeys.exams_tap_no_exams_found.tr(),
          style: Styles.regular(context, 20, color: AppColors.gray87),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}
