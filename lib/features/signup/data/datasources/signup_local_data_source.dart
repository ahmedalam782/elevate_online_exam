import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SignupLocalDataSourceContract {
  Future<void> saveUserToken(String token);
}
