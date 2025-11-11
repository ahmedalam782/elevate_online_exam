import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/exams_tap_body.dart';
import 'package:flutter/material.dart';

class ExamsTapPage extends StatelessWidget {
  const ExamsTapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subjcet Name')),
      body: SafeArea(child: ExamsTapBody()),
    );
  }
}
