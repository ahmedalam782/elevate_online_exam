import '../../../../core/config/base_response/result.dart';

abstract interface class AppLayoutRepository {
  Future<Result<void>> logout();
}
