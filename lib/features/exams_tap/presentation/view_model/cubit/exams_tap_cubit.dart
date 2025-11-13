import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/use_cases/get_exams_on_subject_use_case.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_events.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamsTapCubit extends Cubit<ExamsTapStates> {
  ExamsTapCubit(this._getExamsOnSubjectUseCase) : super(ExamsTapStates());

  final GetExamsOnSubjectUseCase _getExamsOnSubjectUseCase;

  void doIntent(ExamsTapEvents event) {
    event.when(
      getExamsOnSubjectEvent: (event) {
        _getExamsOnSubject(subjectId: event.subjectId, page: event.page ?? 1);
      },
    );
  }

  void _getExamsOnSubject({required String subjectId, int page = 1}) async {
    emit(state.copyWith(examsTapState: BaseState.loading()));
    final result = await _getExamsOnSubjectUseCase.call(
      subjectId: subjectId,
      page: page,
    );
    result.when(
      success: (data) {
        emit(state.copyWith(examsTapState: BaseState.success(data)));
      },
      error: (error) {
        emit(state.copyWith(examsTapState: BaseState.error(error)));
      },
    );
  }
}
