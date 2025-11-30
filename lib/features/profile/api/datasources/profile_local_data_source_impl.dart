import 'dart:convert';

import 'package:elevate_online_exam/features/profile/data/models/profile_model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/profile_local_data_source_contract.dart';

@Injectable(as: ProfileLocalDataSourceContract)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSourceContract {
  final SharedPreferences _sharedPreferences;

  const ProfileLocalDataSourceImpl(this._sharedPreferences);
  @override
  Future<void> cacheProfileData(User user) {
    return _sharedPreferences.setString(
      'cached_user_profile',
      jsonEncode(user),
    );
  }

  @override
  Future<User> getCachedProfileData() {
    return _sharedPreferences.getString('cached_user_profile') != null
        ? compute(
            (jsonString) => User.fromJson(jsonDecode(jsonString)),
            _sharedPreferences.getString('cached_user_profile')!,
          )
        : Future.value(User());
  }
}
