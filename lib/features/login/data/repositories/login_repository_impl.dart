import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/helper/session_token/session_token.dart';
import 'package:elevate_online_exam/features/login/data/datasources/login_local_data_source_contract.dart';
import 'package:elevate_online_exam/features/login/data/datasources/login_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/domain/entities/login_response_model.dart';
import 'package:elevate_online_exam/features/login/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSourceContract remoteDataSource;
  LoginLocalDataSourceContract localDataSource;
  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Result<LoginResponseModel>> loginUser({
    required LoginRequestBody body,
    required bool rememberMe,
  }) async {
    final result = await remoteDataSource.loginUser(
      body: body,
      rememberMe: rememberMe,
    );
    switch (result) {
      case Success(data: final data):
        final response = data?.toEntity();
        if (rememberMe) {
          //save the token inside the secure storage
          await localDataSource.saveToken(response?.token ?? "");
        } else {
          // save the token inside SessionToken Singleton
          SessionToken().token = response?.token ?? "";
        }
        return Success<LoginResponseModel>(data: response);
      case Error(exception: final exception):
        return Error<LoginResponseModel>(exception: exception);
    }
  }
}
