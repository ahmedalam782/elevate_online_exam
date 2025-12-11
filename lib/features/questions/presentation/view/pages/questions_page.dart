import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/explore/domain/entities/subject_entities.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/questions_body.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatelessWidget {
  final ExamEntity examEntity;
  final SubjectEntities subject;

  const QuestionsPage({
    super.key,
    required this.examEntity,
    required this.subject,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuestionsBody(examEntity: examEntity, subject: subject),
    );
  }
}
