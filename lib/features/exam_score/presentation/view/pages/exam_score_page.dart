import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ExamScorePage extends StatelessWidget {
  const ExamScorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.exam_score_exam_score.tr()),

      body: SafeArea(child: Column(children: [])),
    );
  }
}
