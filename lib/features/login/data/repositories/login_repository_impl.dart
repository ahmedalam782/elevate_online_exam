import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/login/data/datasources/login_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/domain/entities/login_response_model.dart';
import 'package:elevate_online_exam/features/login/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSourceContract remoteDataSource;
  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<LoginResponseModel>> loginUser({
    required LoginRequestBody body,
  }) async {
    final result = await remoteDataSource.loginUser(body: body);
    switch (result) {
      case Success(data: final data):
        final response = data?.toEntity();
        return Success(data: response);
      case Error(exception: final exception):
        return Error(exception: exception);
    }
  }
}
