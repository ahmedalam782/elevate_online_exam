// TODO: api QuestionsRemoteDataSourceImpl
import 'package:elevate_online_exam/core/config/api/api_executer.dart';
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/questions/api/api_client/questions_api_client.dart';
import 'package:elevate_online_exam/features/questions/data/datasources/questions_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionsRemoteDataSourceContract)
class QuestionsRemoteDataSourceImpl
    implements QuestionsRemoteDataSourceContract {
  final QuestionsApiClient homeApiClient;

  QuestionsRemoteDataSourceImpl({required this.homeApiClient});

  @override
  Future<Result<List<QuestionDto>>> getQuestsions(String examId) async {
    return await executeApi<List<QuestionDto>>(() async {
      List<QuestionDto> questions = [];
      final response = await homeApiClient.getQuestions(examId);
      for (QuestionDto question in response.questions ?? []) {
        questions.add(question);
      }
      return questions;
    });
  }
}
