import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../repositories/app_layout_repository.dart';

@injectable
class LogoutUseCase {
  final AppLayoutRepository repository;

  LogoutUseCase(this.repository);

  Future<Result<void>> call() async {
    return await repository.logout();
  }
}
