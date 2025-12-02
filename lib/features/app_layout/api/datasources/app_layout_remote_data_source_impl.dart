// TODO: api App_layoutRemoteDataSourceImpl

import 'package:elevate_online_exam/core/config/base_response/result.dart';

import '../../../../core/config/api/api_executer.dart';
import '../../data/datasources/app_layout_remote_data_source_contract.dart';
import '../api_client/app_layout_api_client.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AppLayoutRemoteDataSourceContract)
class AppLayoutRemoteDataSourceImpl
    implements AppLayoutRemoteDataSourceContract {
  final AppLayoutApiClient _appLayoutApiClient;
  const AppLayoutRemoteDataSourceImpl(this._appLayoutApiClient);
  @override
  Future<Result<void>> logout() async {
    return await executeApi<void>(() async {
      return await _appLayoutApiClient.logout();
    });
  }
}
