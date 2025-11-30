// TODO: data ProfileLocalDataSourceContract
import '../models/profile_model/user.dart';

abstract interface class ProfileLocalDataSourceContract {
  Future<User> getCachedProfileData();

  Future<void> cacheProfileData(User user);
}
