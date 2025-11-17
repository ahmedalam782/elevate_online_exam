import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/app_images.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/row_span.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/start_exam_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamRow extends StatelessWidget {
  const ExamRow({super.key, required this.exam});
  final ExamEntity exam;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (context) => StartExamBottomSheet(exam: exam,),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x2A292940),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(
              width: 60.w,
              height: 71.h,
              child:   Image.asset(AppImages.profitImage, fit: BoxFit.cover),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          exam.title,
                          style: Styles.medium(context, 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${exam.duration} min",
                        style: Styles.regular(
                          context,
                          13,
                          color: AppColors.blue02,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${exam.numberOfQuestions} Questions",
                    style: Styles.regular(context, 13, color: AppColors.gray53),
                  ),
                  SizedBox(height: 16.h),
                  Wrap(
                    spacing: 10.w,
                    children: [
                      RowSpan(title: "From: ", spanTitle: "1.00"),
                      RowSpan(title: "To: ", spanTitle: "2.00"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
