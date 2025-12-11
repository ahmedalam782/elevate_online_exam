
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/change_password/data/models/change_password_request_body.dart';
import 'package:elevate_online_exam/features/change_password/data/models/change_password_response_model.dart';


abstract class ChangePasswordRemoteDataSourceContract {
  Future<Result<ChangePasswordResponseModel>> changePassword({
    required ChangePasswordRequestBody params,
  });
}
