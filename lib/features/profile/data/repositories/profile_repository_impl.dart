import 'package:injectable/injectable.dart';
import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source_contract.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSourceContract remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);
  @override
  Future<Result<UserEntity>> getProfileData() async {
    final result = await remoteDataSource.getProfileData();
    switch (result) {
      case Success():
        final entity = result.data?.toEntity();
        return Success(data: entity);
      case Error():
        return Error(exception: result.exception);
    }
  }

  @override
  Future<Result<UserEntity>> updateProfileData(EditProfileParams params) async {
    final result = await remoteDataSource.updateProfileData(params);
    switch (result) {
      case Success():
        final entity = result.data?.toEntity();
        return Success(data: entity);
      case Error():
        return Error(exception: result.exception);
    }
  }
}
