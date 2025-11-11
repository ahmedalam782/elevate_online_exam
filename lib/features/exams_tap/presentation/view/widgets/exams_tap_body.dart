import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/lang.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/exam_row.dart';
import 'package:flutter/material.dart';

class ExamsTapBody extends StatelessWidget {
  const ExamsTapBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.setLocale(englishLocale);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Exam Name', style: Styles.medium(context, 18)),
          SizedBox(height: 16),
          ListView(
            shrinkWrap: true,
            children: [ExamRow(), ExamRow(), ExamRow()],
          ),
        ],
      ),
    );
  }
}
