import 'package:elevate_online_exam/core/config/di/injectable_config.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_app_bar.dart';
import 'package:elevate_online_exam/core/shared/widgets/error_page.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/exams_tap_body.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_cubit.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsTapPage extends StatelessWidget {
  const ExamsTapPage({super.key, this.subjectId});
  final String? subjectId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Subject Name", isCenteredTitle: false),
      body: BlocProvider<ExamsTapCubit>(
        create: (context) => getIt<ExamsTapCubit>()
          ..doIntent(
            ExamsTapEvents.getExamsOnSubjectEvent(
              subjectId: subjectId ?? '',
              page: 1,
            ),
          ),
        child: SafeArea(
          child: subjectId == null || subjectId!.isEmpty
              ? ErrorPage(message: "No subject selected")
              : ExamsTapBody(),
        ),
      ),
    );
  }
}
