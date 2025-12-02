import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/config/api/end_points.dart';
part 'app_layout_api_client.g.dart';

@injectable
@RestApi()
abstract class AppLayoutApiClient {
  @factoryMethod
  factory AppLayoutApiClient(Dio dio) = _AppLayoutApiClient;

  @GET(EndPoints.logout)
  Future<void> logout();
}
