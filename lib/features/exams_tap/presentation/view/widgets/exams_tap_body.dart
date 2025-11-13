import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/errors/handle_errors/handle_errors.dart';
import 'package:elevate_online_exam/core/languages/lang.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_shimmer_list.dart';
import 'package:elevate_online_exam/core/shared/widgets/error_page.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/empty_exams_widget.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/exam_section.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_cubit.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsTapBody extends StatelessWidget {
  const ExamsTapBody({super.key});
  @override
  Widget build(BuildContext context) {
    context.setLocale(englishLocale);
    return BlocBuilder<ExamsTapCubit, ExamsTapStates>(
      builder: (context, state) {
        return state.examsTapState.when(
          initial: () {
            return CustomShimmerList(length: 7, shrinkWrap: true);
          },
          loading: () {
            return CustomShimmerList(length: 7, shrinkWrap: true);
          },
          success: (data) {
            return data.exams.isEmpty
                ? EmptyExamsWidget()
                : ExamSection(exams: data.exams);
          },
          error: (exception) {
            return ErrorPage(message: handleError(exception));
          },
        );
      },
    );
  }
}
