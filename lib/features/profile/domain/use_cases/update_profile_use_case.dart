import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../../../../core/helper/classes/params.dart';
import '../entities/user_entity.dart';
import '../repositories/profile_repository.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepository profileRepository;
  const UpdateProfileUseCase(this.profileRepository);
  Future<Result<UserEntity>> call(EditProfileParams params) async {
    return await profileRepository.updateProfileData(params);
  }
}
