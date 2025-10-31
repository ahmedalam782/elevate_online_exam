import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/data/models/login_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(EndPoints.login)
  Future<LoginResponse> loginUser(@Body() LoginRequestBody body);
}
