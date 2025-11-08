import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/domain/entities/login_response_entity.dart';
import 'package:elevate_online_exam/features/login/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUserUseCase {
  final LoginRepository repository;

  LoginUserUseCase({required this.repository});

  Future<Result<LoginResponseModel>> call({
    required LoginRequestBody body,
    required bool rememberMe,
  }) {
    return repository.loginUser(body: body, rememberMe: rememberMe);
  }
}
