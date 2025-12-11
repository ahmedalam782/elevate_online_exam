import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/explore/domain/entities/subject_entities.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helper/classes/params.dart';
import '../../domain/repositories/explore_repository.dart';
import '../datasources/explore_remote_data_source_contract.dart';

@Injectable(as: ExploreRepository)
class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDataSourceContract _remoteDataSource;
  const ExploreRepositoryImpl(this._remoteDataSource);
  @override
  Future<Result<List<SubjectEntities>>> getSubjects(
    PaginationParams params,
  ) async {
    final result = await _remoteDataSource.getSubjects(params);
    switch (result) {
      case Success():
        final entities = result.data
            ?.map<SubjectEntities>((subject) => subject.toEntity())
            .toList();
        return Success(data: entities);
      case Error():
        return Error(exception: result.exception);
    }
  }
}
