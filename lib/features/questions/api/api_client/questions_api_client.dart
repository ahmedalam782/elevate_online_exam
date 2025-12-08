// TODO: api QuestionsApiClient
import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/features/questions/data/models/questions_response/questions_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'questions_api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class QuestionsApiClient {
  // دي في حالة مثلا في أكثر من بيز يو أر أل
  @factoryMethod
  factory QuestionsApiClient(Dio dio) = _QuestionsApiClient;

  @GET(EndPoints.questions)
  Future<QuestionsResponse> getQuestions(@Query("exam") String examId);
}
