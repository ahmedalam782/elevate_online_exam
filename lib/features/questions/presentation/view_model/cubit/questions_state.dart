part of 'questions_cubit.dart';

class QuestionsState extends BaseState<List<QuestionDto>> {
  final int currentPage;

  QuestionsState.all({
    super.exception,
    super.data,
    super.state = StateType.initial,
    required this.currentPage,
  }) : super.all();

  QuestionsState copyWith({
    StateType? state,
    List<QuestionDto>? data,
    Exception? exception,
    int? currentPage,
  }) {
    return QuestionsState.all(
      state: state ?? this.state,
      data: data ?? this.data,
      exception: exception ?? this.exception,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [state, data, exception, currentPage];
}
