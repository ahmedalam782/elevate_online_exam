import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/use_cases/get_exams_on_subject_use_case.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_events.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamsTapCubit extends Cubit<ExamsTapStates> {
  ExamsTapCubit(this._getExamsOnSubjectUseCase) : super(ExamsTapStates());

  final GetExamsOnSubjectUseCase _getExamsOnSubjectUseCase;
  bool _isLoadingMore = false;
  void init(String subjectId) {
    doIntent(ExamsTapEvents.getExamsOnSubjectEvent(subjectId: subjectId));
  }

  void doIntent(ExamsTapEvents event) {
    event.when(
      getExamsOnSubjectEvent: (event) {
        _getExamsOnSubject(subjectId: event.subjectId, page: event.page ?? 1);
      },
      loadExamsNextPageEvent: (event) {
        _loadNextExamsPage(subjectId: event.subjectId);
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

  void _loadNextExamsPage({required String subjectId}) async {
    if (_isLoadingMore) return;
    final currentState = state.examsTapState;
    if (state.examsTapState.state != StateType.success) return;

    final currentData = currentState.data!;
    final hasMoreData = currentData.currentPage < currentData.totalPages;

    if (!hasMoreData) return;
    _isLoadingMore = true;
    emit(
      state.copyWith(
        examsTapState: BaseState.all(
          exception: null,
          data: currentData,
          state: StateType.moreLoading,
        ),
      ),
    );
    final nextPage = currentData.currentPage + 1;

    final resp = await _getExamsOnSubjectUseCase.call(
      subjectId: subjectId,
      page: nextPage,
    );
    resp.when(
      success: (moreData) {
        if (moreData == null) return;
        final allItems = currentData.exams + moreData.exams;
        final mergedData = PaginatedExams(
          exams: allItems,
          currentPage: moreData.currentPage,
          totalPages: moreData.totalPages,
        );
        emit(state.copyWith(examsTapState: BaseState.success(mergedData)));
      },
      error: (error) {
        emit(state.copyWith(examsTapState: BaseState.error(error)));
      },
    );
    _isLoadingMore = false;
  }
}
