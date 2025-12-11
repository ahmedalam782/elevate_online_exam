import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/features/change_password/data/datasources/change_password_local_data_source_contract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordLocalDataSourceContract)
class ChangePasswordLocalDataSourceImpl extends ChangePasswordLocalDataSourceContract{

  FlutterSecureStorage secureStorage;
  ChangePasswordLocalDataSourceImpl({required this.secureStorage});
  @override
  Future<void> saveNewToken({required String token}) async{
    try {
      await secureStorage.write(key: Apikeys.accessToken, value: token);
    } catch (e) {
      secureStorage.write(key: Apikeys.accessToken, value: null);
    }
  }
}