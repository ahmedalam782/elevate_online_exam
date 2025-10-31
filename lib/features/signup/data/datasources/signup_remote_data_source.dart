import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/signup/data/models/signup_post_model/signup_post_dto.dart';
import 'package:elevate_online_exam/features/signup/data/models/signup_response/signup_response.dart';

abstract class SignupRemoteDataSourceContract {
  Future<Result<SignupResponse>> signupUser(SignupPostDto signupPostModel);
}
