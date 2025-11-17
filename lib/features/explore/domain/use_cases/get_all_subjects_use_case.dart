import 'package:elevate_online_exam/core/helper/classes/params.dart';

import '../../../../core/config/base_response/result.dart';
import '../entities/subject_entities.dart';
import '../repositories/explore_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSubjectsUseCase {
  final ExploreRepository exploreRepository;
  const GetAllSubjectsUseCase(this.exploreRepository);
  Future<Result<List<SubjectEntities>>> call(PaginationParams paginationParams) async =>
      await exploreRepository.getSubjects(paginationParams);
}
