sealed class QuestionsEvent {}

class AnswerSelectedEvent extends QuestionsEvent {
  final String selectAnswer;
  final int index;

  AnswerSelectedEvent({required this.index, required this.selectAnswer});
}

class QuestionChanged extends QuestionsEvent {
  final int currentPage;

  QuestionChanged({required this.currentPage});
}

class GetQuestionsEvent extends QuestionsEvent {
  final String examId;

  GetQuestionsEvent({required this.examId});
}
