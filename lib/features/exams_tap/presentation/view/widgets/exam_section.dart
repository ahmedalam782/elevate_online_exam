import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/exam_row.dart';
import 'package:flutter/material.dart';

class ExamSection extends StatelessWidget {
  const ExamSection({super.key, required this.exams});
  final List<ExamEntity> exams;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: exams.length,
          itemBuilder: (context, index) {
            return ExamRow(exam: exams[index]);
          },
        ),
      ),
    );
  }
}
