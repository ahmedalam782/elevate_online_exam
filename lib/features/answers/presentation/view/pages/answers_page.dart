import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_app_bar.dart';
import 'package:elevate_online_exam/features/answers/presentation/view/widgets/answers_body.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';
import 'package:flutter/material.dart';

class AnswersPage extends StatelessWidget {
  final List<QuestionEntity> questions;
  const AnswersPage({super.key, required this.questions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Answers".tr(), isCenteredTitle: false),
      body: AnswersBody(questions: questions),
    );
  }
}
