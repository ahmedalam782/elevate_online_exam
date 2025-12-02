import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/result/domain/use_case/get_exams_use_case.dart';
import 'package:elevate_online_exam/features/result/presentation/view_model/cubit/results_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'results_state.dart';

@lazySingleton
class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit({required GetExamsUseCase getExamsUseCase})
    : _getExamsUseCase = getExamsUseCase,
      super(ResultsState(exams: []));

  final GetExamsUseCase _getExamsUseCase;

  void doIntent(ResultsEvent event) => switch (event) {
    GetResultsEvent() => _getResults(),
  };

  void _getResults() {
    emit(state.copyWith(isLoading: true));

    try {
      final result = _getExamsUseCase.call(); // await if returns Future
      final newList = List<ExamEntity>.from(result);
      emit(state.copyWith(exams: newList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
