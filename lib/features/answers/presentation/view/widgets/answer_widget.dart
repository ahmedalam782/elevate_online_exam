import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerWidget extends StatelessWidget {
  final bool isSelectedAndCorrect;
  final bool isSelectedAndIncorrect;
  final bool isIncorrectAndNotSelected;
  final bool isCorrectAndNotSelected;
  final String answer;

  const AnswerWidget({
    super.key,
    required this.isSelectedAndCorrect,
    required this.isSelectedAndIncorrect,
    required this.isIncorrectAndNotSelected,
    required this.answer,
    required this.isCorrectAndNotSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isCorrectAndNotSelected) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color(0xffCAF9CC),
          border: Border.all(color: AppColors.primeAccent, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primeAccent, width: 2),
              ),
              child: isSelectedAndCorrect
                  ? Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: AppColors.primeAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Text(answer, style: Styles.regular(context, 14.sp)),
            ),
          ],
        ),
      );
    }
    //
    if (isIncorrectAndNotSelected) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color(0xffEDEFF3),
        ),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: AppColors.prime),
              ),
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Text(answer, style: Styles.regular(context, 14.sp)),
            ),
          ],
        ),
      );
    } else if (isSelectedAndCorrect) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color(0xffCAF9CC),
          border: Border.all(color: AppColors.primeAccent, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primeAccent, width: 2),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    color: AppColors.primeAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Text(answer, style: Styles.regular(context, 14.sp)),
            ),
          ],
        ),
      );
    } else if (isSelectedAndIncorrect) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color(0xffF8D2D2),
          border: Border.all(color: AppColors.errorDark, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.errorDark, width: 2),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    color: AppColors.errorDark,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Text(answer, style: Styles.regular(context, 14.sp)),
            ),
          ],
        ),
      );
    }
    return Text("NOT");
  }
}
