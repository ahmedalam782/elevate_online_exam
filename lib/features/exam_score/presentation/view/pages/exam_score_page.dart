import 'package:elevate_online_exam/features/exam_score/presentation/view/widgets/exam_score_body.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:flutter/material.dart';

class ExamScorePage extends StatelessWidget {
  final ExamEntity exam;
  const ExamScorePage({super.key, required this.exam});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        // appBar: CustomAppBar(title: LocaleKeys.exam_score_exam_score.tr()),
        body: ExamScoreBody(exam: exam),
      ),
    );
  }
}
