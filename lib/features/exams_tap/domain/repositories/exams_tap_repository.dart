import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';

abstract class ExamsTapRepository {
  Future<Result<PaginatedExams>> getExams({
    required String subjectId,
    int page = 1,
  });
}
