import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/signup/domain/models/signup_post_entity.dart';
import 'package:elevate_online_exam/features/signup/domain/models/user_entity.dart';

abstract class SignupRepositoryContract {
  Future<Result<UserEntity>> sigupUser(SignupPostEntity signupPostModel);
}
