import 'package:elevate_online_exam/core/config/base_response/result.dart';

import '../../../../core/helper/classes/params.dart';

abstract class ForgetPasswordRepository {
  Future<Result<void>> sendForgetPasswordCode(ForgetPasswordParams params);
  Future<Result<void>> verifyForgetPasswordCode(ForgetPasswordParams params);
  Future<Result<void>> resetPassword(ForgetPasswordParams params);
}
