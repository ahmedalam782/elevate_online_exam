// TODO: api SignupApiClient
import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/features/signup/data/models/signup_post_model/signup_post_dto.dart';
import 'package:elevate_online_exam/features/signup/data/models/signup_response/signup_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'sigup_api_client.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class SigupApiClient {
  @factoryMethod
  factory SigupApiClient(Dio dio) = _SigupApiClient;

  @POST(EndPoints.signupToken)
  Future<SignupResponse> signupUser(@Body() SignupPostDto sigupModel);
}
