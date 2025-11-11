import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';

abstract class QuestionsRemoteDataSourceContract {
  Future<Result<List<QuestionDto>>> getQuestsions(String examId);
}
