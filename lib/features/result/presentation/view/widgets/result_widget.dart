import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/theme/app_images.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultWidget extends StatelessWidget {
  final ExamEntity examEntity;
  const ResultWidget({super.key, required this.examEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 8.r,
            color: Color(0xff2A292940).withAlpha(63),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            height: 71.h,
            child: Image.asset(AppImages.profitImage, fit: BoxFit.cover),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        examEntity.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.medium(context, 16),
                      ),
                    ),
                    Text(
                      "${examEntity.duration} ${LocaleKeys.date_time_minutes.tr()}",
                      style: Styles.regular(
                        context,
                        12,
                        color: Color(0xff535353),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${examEntity.numberOfQuestions} ${LocaleKeys.questions_question.tr()}",
                  style: Styles.regular(context, 12, color: Color(0xff535353)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
