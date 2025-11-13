import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/repositories/exams_tap_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetExamsOnSubjectUseCase {
  ExamsTapRepository repository;
  GetExamsOnSubjectUseCase(this.repository);

  Future<Result<PaginatedExams>> call({required String subjectId, int page = 1}) {
    return repository.getExams(subjectId: subjectId, page: page);
  }
}