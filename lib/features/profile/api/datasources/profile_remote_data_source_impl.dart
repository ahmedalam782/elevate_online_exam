// TODO: api ProfileRemoteDataSourceImpl

import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/helper/classes/params.dart';
import 'package:elevate_online_exam/features/profile/data/datasources/profile_local_data_source_contract.dart';
import 'package:elevate_online_exam/features/profile/data/models/profile_model/user.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/api/api_executer.dart';
import '../../data/datasources/profile_remote_data_source_contract.dart';
import '../api_client/profile_api_client.dart';

@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceContract {
  final ProfileApiClient _profileApiClient;
  final ProfileLocalDataSourceContract _profileLocalDataSourceContract;
  const ProfileRemoteDataSourceImpl(
    this._profileApiClient,
    this._profileLocalDataSourceContract,
  );
  @override
  Future<Result<User>> getProfileData() async {
    return await executeApi<User>(() async {
      final response = await _profileApiClient.getProfileData();
      await _profileLocalDataSourceContract.cacheProfileData(
        response.user ?? User(),
      );
      return response.user ?? User();
    });
  }

  @override
  Future<Result<User>> updateProfileData(EditProfileParams params) {
    return executeApi<User>(() async {
      final User cachedUser = await _profileLocalDataSourceContract
          .getCachedProfileData();
      if (params.firstName == cachedUser.firstName) {
        params = params.copyWith(firstName: null);
      } else if (params.lastName == cachedUser.lastName) {
        params = params.copyWith(lastName: null);
      } else if (params.email == cachedUser.email) {
        params = params.copyWith(email: null);
      } else if (params.phone == cachedUser.phone) {
        params = params.copyWith(phone: null);
      }
      final response = await _profileApiClient.updateProfileData(params);
      await _profileLocalDataSourceContract.cacheProfileData(
        response.user ?? User(),
      );
      return response.user ?? User();
    });
  }
}
