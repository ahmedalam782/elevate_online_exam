import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/features/login/data/datasources/login_local_data_source_contract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LoginLocalDataSourceContract)
class LoginLocalDataSourceImpl implements LoginLocalDataSourceContract {
  FlutterSecureStorage secureStorage;
  SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({
    required this.secureStorage,
    required this.sharedPreferences,
  });
  @override
  Future<void> saveToken(String? token) async {
    try {
      await secureStorage.write(key: Apikeys.accessToken, value: token);
    } catch (e) {
      // if couldn't save the token in secure storage, save it in SessionToken Singleton for one time use
      secureStorage.write(key: Apikeys.accessToken, value: null);
    }
  }

  @override
  Future<void> saveRememberMe(bool isRemeberMe) async {
    try {
      await sharedPreferences.setBool(Apikeys.rememberMe, isRemeberMe);
    } catch (e) {
      sharedPreferences.setBool(Apikeys.rememberMe, false);
    }
  }
}
