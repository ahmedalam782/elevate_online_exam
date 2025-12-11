import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/data/models/login_response.dart';

abstract class LoginRemoteDataSourceContract {
  Future<Result<LoginResponse>> loginUser({
    required LoginRequestBody body,
    required bool rememberMe,
  });
}
