
import 'package:elevate_online_exam/core/config/base_response/result.dart';

import '../../../../core/helper/classes/params.dart';
import '../models/subjects_model/subject.dart';

abstract class ExploreRemoteDataSourceContract {
  Future<Result<List<Subject>>> getSubjects(PaginationParams paginationParams);
}