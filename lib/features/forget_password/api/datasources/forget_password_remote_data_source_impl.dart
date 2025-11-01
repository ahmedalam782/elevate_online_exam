import 'package:elevate_online_exam/core/config/api/api_executer.dart';
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helper/classes/params.dart';
import '../../data/datasources/forget_password_remote_data_source_contract.dart';
import '../api_client/forget_password_api_client.dart';

@Injectable(as: ForgetPasswordRemoteDataSourceContract)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSourceContract {
  final ForgetPasswordApiClient apiClient;

  const ForgetPasswordRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Result<void>> sendForgetPasswordCode(
    ForgetPasswordParams params,
  ) async {
    return await executeApi<void>(() {
      return apiClient.sendForgetPasswordCode(params);
    });
  }

  @override
  Future<Result<void>> verifyForgetPasswordCode(
    ForgetPasswordParams params,
  ) async {
    return await executeApi<void>(() {
      return apiClient.verifyForgetPasswordCode(params);
    });
  }

  @override
  Future<Result<void>> resetPassword(ForgetPasswordParams params) async {
    return await executeApi<void>(() {
      return apiClient.resetPassword(params);
    });
  }
}
