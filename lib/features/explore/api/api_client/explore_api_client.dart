import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/helper/classes/params.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/config/api/end_points.dart';
import '../../data/models/subjects_model/subjects_model.dart';
part 'explore_api_client.g.dart';

@injectable
@RestApi()
abstract class ExploreApiClient {
  @factoryMethod
  factory ExploreApiClient(Dio dio) = _ExploreApiClient;

  @GET(EndPoints.subjects)
  Future<SubjectsModel> getSubjects(
      @Queries() PaginationParams paginationParams,
  );
}
