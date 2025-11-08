import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../../domain/repositories/forget_password_repository.dart';
import '../datasources/forget_password_remote_data_source_contract.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSourceContract remoteDataSource;

  const ForgetPasswordRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<void>> sendForgetPasswordCode(
    ForgetPasswordParams params,
  ) async {
    return await remoteDataSource.sendForgetPasswordCode(params);
  }

  @override
  Future<Result<void>> verifyForgetPasswordCode(
    ForgetPasswordParams params,
  ) async {
    return await remoteDataSource.verifyForgetPasswordCode(params);
  }

  @override
  Future<Result<void>> resetPassword(ForgetPasswordParams params) async {
    return await remoteDataSource.resetPassword(params);
  }
}
