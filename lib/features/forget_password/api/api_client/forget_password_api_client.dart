import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/config/api/end_points.dart';
import '../../../../core/helper/classes/params.dart';
part 'forget_password_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  @POST(EndPoints.forgetPassword)
  Future<void> sendForgetPasswordCode(@Body() ForgetPasswordParams request);

  @POST(EndPoints.verifyEmailCode)
  Future<void> verifyForgetPasswordCode(@Body() ForgetPasswordParams request);

  @PUT(EndPoints.resetPassword)
  Future<void> resetPassword(@Body() ForgetPasswordParams request);
}
