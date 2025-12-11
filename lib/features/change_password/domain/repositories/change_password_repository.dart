import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_params.dart';
import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_response_entity.dart';

abstract class ChangePasswordRepository {
  Future<Result<ChangePasswordResponseEntity>> changePassword({
    required ChangePasswordParams params,
  });

  Future<void> saveNewToken({required String token});
}
