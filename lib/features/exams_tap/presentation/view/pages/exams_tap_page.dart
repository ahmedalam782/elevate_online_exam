import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/config/di/injectable_config.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_app_bar.dart';
import 'package:elevate_online_exam/core/shared/widgets/error_page.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/exams_tap_body.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_cubit.dart';
import "../../../../explore/domain/entities/subject_entities.dart";

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsTapPage extends StatelessWidget {
  const ExamsTapPage({super.key, this.subject});
  final SubjectEntities? subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: subject?.name ?? "unknown subject", isCenteredTitle: false),
      body: BlocProvider<ExamsTapCubit>(
        create: (context) => getIt<ExamsTapCubit>()..init(subject?.id ?? ""), 
        child: SafeArea(
          child: subject?.id == null || subject!.id.isEmpty
              ? ErrorPage(message: LocaleKeys.exams_tap_no_subject_selected.tr())
              : ExamsTapBody(subjectId: subject?.id ?? ''),
        ),
      ),
    );
  }
}
