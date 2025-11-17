import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../entities/subject_entities.dart';
abstract class ExploreRepository {
  Future<Result<List<SubjectEntities>>> getSubjects(PaginationParams paginationParams);
}
