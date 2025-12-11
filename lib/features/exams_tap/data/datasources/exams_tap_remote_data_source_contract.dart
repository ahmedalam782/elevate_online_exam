
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exams_response_dto.dart';

abstract class ExamsTapRemoteDataSourceContract {
  Future<Result<ExamsResponseDto>> getExams({
   required Map<String, dynamic> queries
  });
}
