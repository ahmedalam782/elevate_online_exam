import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../repositories/forget_password_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepository repository;

  const ForgetPasswordUseCase({required this.repository});

  Future<Result<void>> call(ForgetPasswordParams params) async {
    return await repository.sendForgetPasswordCode(params);
  }
}
