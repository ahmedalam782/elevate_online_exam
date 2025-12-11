import 'package:elevate_online_exam/core/config/api/api_executer.dart';
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/change_password/api/api_client/change_password_api_client.dart';
import 'package:elevate_online_exam/features/change_password/data/datasources/change_password_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/change_password/data/models/change_password_request_body.dart';
import 'package:elevate_online_exam/features/change_password/data/models/change_password_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRemoteDataSourceContract)
class ChangePasswordRemoteDataSourceImpl
    extends ChangePasswordRemoteDataSourceContract {

  final ChangePasswordApiClient apiClient;

  ChangePasswordRemoteDataSourceImpl({required this.apiClient});
  @override
  Future<Result<ChangePasswordResponseModel>> changePassword({
    required ChangePasswordRequestBody params,
  }) async {
    return await executeApi((){
      return apiClient.changePassword(params);
    });
  }
}
