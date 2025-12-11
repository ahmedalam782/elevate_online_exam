import 'package:elevate_online_exam/core/config/base_response/result.dart';

abstract interface class AppLayoutRemoteDataSourceContract {
  Future<Result<void>> logout();
}
