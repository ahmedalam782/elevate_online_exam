import 'package:bloc/bloc.dart';
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/questions/data/models/dummy_data.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';
import 'package:elevate_online_exam/features/questions/domain/use_cases/get_questions_use_case.dart';
import 'package:elevate_online_exam/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'questions_state.dart';

@Injectable()
class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit({required GetQuestionsUseCase questionsUseCase})
    : _getQuestionsUseCase = questionsUseCase,
      super(QuestionsState.all(currentPage: 0));
  Future<void> doIntent(QuestionsEvent event) async => switch (event) {
    AnswerSelectedEvent() => _selectAnswer(event.index, event.selectAnswer),
    GetQuestionsEvent() => _getQuestions(event.examId),
    QuestionChanged() => _changeQuestion(event.currentPage),
  };
  final GetQuestionsUseCase _getQuestionsUseCase;

  void _selectAnswer(int index, String answer) {
    final currentData = List<QuestionEntity>.from(state.data ?? []);

    final updatedQuestion = currentData[index].copyWith(
      answeredQuestion: answer,
    );

    currentData[index] = updatedQuestion;

    emit(state.copyWith(state: StateType.success, data: currentData));
  }

  void _changeQuestion(int currentPage) {
    // emit(state.copyWith(state: StateType.loading));
    // emit(state.copyWith(state: StateType.success, currentPage: currentPage));
    emit(
      QuestionsState.all(
        state: StateType.success,
        currentPage: currentPage,
        data: List.from(state.data ?? []), // clone list to force new reference
        exception: state.exception,
      ),
    );
  }

  void _getQuestions(String examId) async {
    emit(state.copyWith(state: StateType.loading));
    final response = await _getQuestionsUseCase.call(examId);
    switch (response) {
      case Success<List<QuestionEntity>>():
        emit(state.copyWith(state: StateType.success, data: response.data));
      case Error<List<QuestionEntity>>():
        emit(state.copyWith(state: StateType.error));
    }
  }
}
