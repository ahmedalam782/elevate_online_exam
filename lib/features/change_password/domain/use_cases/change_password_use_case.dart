import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_params.dart';
import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_response_entity.dart';
import 'package:elevate_online_exam/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  ChangePasswordRepository repository;
  ChangePasswordUseCase({required this.repository});

  Future<Result<ChangePasswordResponseEntity>> call({
    required ChangePasswordParams params,
  }) {
    return repository.changePassword(params: params);
  }
}