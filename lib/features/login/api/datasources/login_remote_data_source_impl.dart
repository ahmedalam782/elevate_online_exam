import 'package:elevate_online_exam/core/config/api/api_executer.dart';
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/login/api/api_client/api_client.dart';
import 'package:elevate_online_exam/features/login/data/datasources/login_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/data/models/login_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginRemoteDataSourceImpl implements LoginRemoteDataSourceContract {
  LoginRemoteDataSourceImpl({required this.apiClient});

  ApiClient apiClient;
  @override
  Future<Result<LoginResponse>> loginUser({
    required LoginRequestBody body,
  }) async {
    try {
      final response = await apiClient.loginUser(body);
      return Success(data: response);
    } catch (e) {
      return Error(exception: e as Exception);
    }
  }
}
