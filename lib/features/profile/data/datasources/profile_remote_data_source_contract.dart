import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../models/profile_model/user.dart';

abstract interface class ProfileRemoteDataSourceContract {
  Future<Result<User>> getProfileData();
  Future<Result<User>> updateProfileData(EditProfileParams params);
}
