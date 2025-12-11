import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../repositories/forget_password_repository.dart';

@injectable
class VerifyResetCodeUseCase {
  final ForgetPasswordRepository repository;

  const VerifyResetCodeUseCase(this.repository);

  Future<Result<void>> call(ForgetPasswordParams params) {
    return repository.verifyForgetPasswordCode(params);
  }
}
