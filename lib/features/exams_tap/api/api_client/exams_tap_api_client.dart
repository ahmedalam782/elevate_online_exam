import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exams_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'exams_tap_api_client.g.dart';
@lazySingleton
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ExamsTapApiClient {
  @factoryMethod
  factory ExamsTapApiClient(Dio dio) => _ExamsTapApiClient(dio);

  @GET(EndPoints.exams)
  Future<ExamsResponseDto> getExams(@Queries() Map<String, dynamic> queries);
}
