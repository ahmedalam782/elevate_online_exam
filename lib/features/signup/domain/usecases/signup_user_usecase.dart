import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/signup/domain/models/signup_post_entity.dart';
import 'package:elevate_online_exam/features/signup/domain/models/user_entity.dart';
import 'package:elevate_online_exam/features/signup/domain/repositories/signup_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUserUsecase {
  final SignupRepositoryContract repo;

  SignupUserUsecase({required this.repo});
  Future<Result<UserEntity>> call(SignupPostEntity data) =>
      repo.sigupUser(data);
}
