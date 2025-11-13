import 'package:elevate_online_exam/core/theme/app_colors.dart';
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
          child: Image.asset('assets/images/profit.png', fit: BoxFit.contain),
        ),
        SizedBox(height: 20.h),
        Text(
          'no exams found',
          style: Styles.regular(context, 20, color: AppColors.gray87),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
