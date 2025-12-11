import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/widgets/exam_row.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_cubit.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_events.dart';
import 'package:elevate_online_exam/features/explore/domain/entities/subject_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamSection extends StatefulWidget {
  const ExamSection({super.key, required this.exams, required this.subject});

  final List<ExamEntity> exams;
  final SubjectEntities? subject;

  @override
  State<ExamSection> createState() => _ExamSectionState();
}

class _ExamSectionState extends State<ExamSection> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        context.read<ExamsTapCubit>().doIntent(
          ExamsTapEvents.loadExamsNextPageEvent(
            subjectId: widget.subject?.id ?? "",
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.exams.length + 1,
          itemBuilder: (context, index) {
            if (index == widget.exams.length) {
              return context.read<ExamsTapCubit>().state.examsTapState.state ==
                      StateType.moreLoading
                  ? CircularProgressIndicator()
                  : SizedBox.shrink();
            }
            return ExamRow(exam: widget.exams[index], subject: widget.subject);
          },
        ),
      ),
    );
  }
}
