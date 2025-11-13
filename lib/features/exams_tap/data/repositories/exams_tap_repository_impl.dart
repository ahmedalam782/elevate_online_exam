import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/exams_tap/data/datasources/exams_tap_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exam_query_params.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exams_response_dto.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/repositories/exams_tap_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ExamsTapRepository)
class ExamsTapRepositoryImpl implements ExamsTapRepository {
  ExamsTapRemoteDataSourceContract examsTapRemoteDataSourceContract;
  ExamsTapRepositoryImpl({required this.examsTapRemoteDataSourceContract});

  @override
  Future<Result<PaginatedExams>> getExams({
    required String subjectId,
    int page = 1,
  }) async{
    final params = ExamQueryParams(page: page, subjectId: subjectId);
    final result = await examsTapRemoteDataSourceContract.getExams(queries: params.toMap());
    return result.when<Result<PaginatedExams>>(
      success: (data) {
        return Success<PaginatedExams>(data: data?.toPaginatedExams());
      },
      error: (exception) => Error<PaginatedExams>(exception: exception),
    );
  }
}
