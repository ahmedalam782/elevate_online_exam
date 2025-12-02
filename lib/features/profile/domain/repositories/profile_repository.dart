import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../entities/user_entity.dart';

abstract interface class ProfileRepository {
  Future<Result<UserEntity>> getProfileData();
  Future<Result<UserEntity>> updateProfileData(EditProfileParams params);
}
