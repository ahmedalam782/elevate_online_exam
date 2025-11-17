import 'package:elevate_online_exam/features/explore/data/models/subjects_model/subject.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/api/api_executer.dart';
import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../../data/datasources/explore_remote_data_source_contract.dart';
import '../api_client/explore_api_client.dart';

@Injectable(as: ExploreRemoteDataSourceContract)
class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSourceContract {
  final ExploreApiClient _exploreApiClient;
  const ExploreRemoteDataSourceImpl(this._exploreApiClient);
  @override
  Future<Result<List<Subject>>> getSubjects(PaginationParams paginationParams) async {
    return await executeApi<List<Subject>>(() async {
      final subjectsModel = await _exploreApiClient.getSubjects(paginationParams);
      return subjectsModel.subjects ?? [];
    });
  }
}
