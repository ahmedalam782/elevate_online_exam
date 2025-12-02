import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/change_password/data/datasources/change_password_local_data_source_contract.dart';
import 'package:elevate_online_exam/features/change_password/data/datasources/change_password_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/change_password/data/models/change_password_request_body.dart';
import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_params.dart';
import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_response_entity.dart';
import 'package:elevate_online_exam/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImpl extends ChangePasswordRepository {
  final ChangePasswordRemoteDataSourceContract remoteDataSource;
  final ChangePasswordLocalDataSourceContract localDataSource;
  ChangePasswordRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Result<ChangePasswordResponseEntity>> changePassword({
    required ChangePasswordParams params,
  }) async {
    final requestBody = ChangePasswordRequestBody.fromEntity(params);
    final result = await remoteDataSource.changePassword(params: requestBody);
    return result.when(
      success: (data) => Success<ChangePasswordResponseEntity>(data:data?.toEntity()),
      error: (exception) => Error<ChangePasswordResponseEntity>(exception: exception),
    );
  }
  
  @override
  Future<void> saveNewToken({required String token}) {
    return localDataSource.saveNewToken(token: token);
  }
}
