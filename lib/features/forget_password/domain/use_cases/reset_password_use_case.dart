import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../repositories/forget_password_repository.dart';
@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepository repository;

  const ResetPasswordUseCase(this.repository);

  Future<Result<void>> call(ForgetPasswordParams params) async {
    return await repository.resetPassword(params);
  }
}
