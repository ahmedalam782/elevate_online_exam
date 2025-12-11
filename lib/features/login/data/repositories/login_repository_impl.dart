import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/login/data/datasources/login_local_data_source_contract.dart';
import 'package:elevate_online_exam/features/login/data/datasources/login_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/domain/entities/login_response_entity.dart';
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
        localDataSource.saveToken(response?.token);
        localDataSource.saveRememberMe(rememberMe);
        return Success<LoginResponseModel>(data: response);
      case Error(exception: final exception):
        return Error<LoginResponseModel>(exception: exception);
    }
  }
}
