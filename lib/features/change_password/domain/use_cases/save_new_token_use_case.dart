import 'package:elevate_online_exam/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveNewTokenUseCase {
  SaveNewTokenUseCase({required this.repository});
ChangePasswordRepository repository;

  Future<void> call({required String token}) {
    return repository.saveNewToken(token: token);
  }
}