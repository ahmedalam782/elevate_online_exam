part of 'questions_cubit.dart';

class QuestionsState extends BaseState<List<QuestionEntity>> {
  final int currentPage;

  QuestionsState.all({
    super.exception,
    super.data,
    super.state = StateType.initial,
    required this.currentPage,
  }) : super.all();

  QuestionsState copyWith({
    StateType? state,
    List<QuestionEntity>? data,
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
