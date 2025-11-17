import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';
import 'package:elevate_online_exam/features/questions/domain/repositories/questions_repository.dart'
    show QuestionsRepositoryContract;
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionsUseCase {
  final QuestionsRepositoryContract repo;

  GetQuestionsUseCase({required this.repo});
  Future<Result<List<QuestionEntity>>> call(String examId) =>
      repo.getQuestions(examId);
}
