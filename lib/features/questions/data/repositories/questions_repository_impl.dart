// TODO: data QuestionsRepositoryImpl
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/questions/api/datasources/questions_local_data_source_impl.dart';
import 'package:elevate_online_exam/features/questions/api/datasources/questions_remote_data_source_impl.dart';
import 'package:elevate_online_exam/features/questions/data/datasources/questions_local_data_source_contract.dart';
import 'package:elevate_online_exam/features/questions/data/datasources/questions_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';
import 'package:elevate_online_exam/features/questions/domain/repositories/questions_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionsRepositoryContract)
class QuestionsRepositoryImpl implements QuestionsRepositoryContract {
  final QuestionsLocalDataSourceContract questionsLocalDataSource;
  final QuestionsRemoteDataSourceContract questionsRemoteDataSource;

  QuestionsRepositoryImpl({
    required this.questionsLocalDataSource,
    required this.questionsRemoteDataSource,
  });

  @override
  Future<Result<List<QuestionEntity>>> getQuestions(String examId) async {
    final response = await questionsRemoteDataSource.getQuestsions(examId);
    switch (response) {
      case Success<List<QuestionDto>>():
        List<QuestionEntity> questions =
            response.data?.map((question) {
              return question.toEntity();
            }).toList() ??
            [];
        return Success<List<QuestionEntity>>(data: questions);
      case Error<List<QuestionDto>>():
        return Error<List<QuestionEntity>>(exception: response.exception);
    }
  }
}
