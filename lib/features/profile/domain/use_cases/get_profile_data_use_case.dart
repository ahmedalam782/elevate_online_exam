import '../../../../core/config/base_response/result.dart';
import '../entities/user_entity.dart';
import '../repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileDataUseCase {
  final ProfileRepository repository;

  const GetProfileDataUseCase(this.repository);

  Future<Result<UserEntity>> call() async {
    return await repository.getProfileData();
  }
}
