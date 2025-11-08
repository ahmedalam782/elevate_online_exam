import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/features/signup/data/datasources/signup_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupLocalDataSourceContract)
class SignupLocalDataSourceImpl implements SignupLocalDataSourceContract {
  final FlutterSecureStorage fss;

  SignupLocalDataSourceImpl({required this.fss});
  @override
  Future<void> saveUserToken(String token) async {
    try {
      fss.write(key: Apikeys.accessToken, value: token);
    } catch (e) {}
  }
}
