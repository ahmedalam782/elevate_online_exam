// results_state.dart
part of 'results_cubit.dart';

class ResultsState extends Equatable {
  final List<ExamEntity> exams;
  final bool isLoading;

  const ResultsState({this.exams = const [], this.isLoading = false});

  ResultsState copyWith({List<ExamEntity>? exams, bool? isLoading}) {
    return ResultsState(
      // create a NEW list instance to avoid identity-equality issues
      exams: exams != null
          ? List<ExamEntity>.unmodifiable(List.from(exams))
          : this.exams,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [exams, isLoading];
}
