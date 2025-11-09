import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/domain/entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<Result<LoginResponseModel>> loginUser({
    required LoginRequestBody body,
    required bool rememberMe,
  });
}
