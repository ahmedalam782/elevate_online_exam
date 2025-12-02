
import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/features/change_password/data/models/change_password_request_body.dart';
import 'package:elevate_online_exam/features/change_password/data/models/change_password_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'change_password_api_client.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ChangePasswordApiClient {
@factoryMethod
factory ChangePasswordApiClient(Dio dio) = _ChangePasswordApiClient;

  @PATCH(EndPoints.changePassword)
  Future<ChangePasswordResponseModel> changePassword(@Body() ChangePasswordRequestBody params);
}
