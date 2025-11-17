// TODO: domain QuestionsRepository

import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';

abstract class QuestionsRepositoryContract {
  Future<Result<List<QuestionEntity>>> getQuestions(String examId);
}
