import '../../../../core/config/base_response/result.dart';
import '../../domain/repositories/app_layout_repository.dart';
import '../datasources/app_layout_remote_data_source_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AppLayoutRepository)
class AppLayoutRepositoryImpl implements AppLayoutRepository {
  final AppLayoutRemoteDataSourceContract remoteDataSource;

  const AppLayoutRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<void>> logout() {
    return remoteDataSource.logout();
  }
}
