// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/signup/api/api_client/sigup_api_client.dart' as _i873;
import '../../../features/signup/api/datasources/signup_local_data_source_impl.dart'
    as _i471;
import '../../../features/signup/api/datasources/signup_remote_data_source_impl.dart'
    as _i500;
import '../../../features/signup/data/datasources/signup_local_data_source.dart'
    as _i229;
import '../../../features/signup/data/datasources/signup_remote_data_source.dart'
    as _i739;
import '../../../features/signup/data/repositories/signup_repository_impl.dart'
    as _i527;
import '../../../features/signup/domain/repositories/signup_repository_contract.dart'
    as _i1062;
import '../../../features/signup/domain/usecases/signup_user_usecase.dart'
    as _i1042;
import '../../../features/signup/presentation/view_model/cubit/signup_cubit.dart'
    as _i662;
import '../../helper/user_helper/user_helper.dart' as _i23;
import '../api/app_interceptor.dart' as _i449;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreInjectableModule = _$CoreInjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreInjectableModule.prefs(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => coreInjectableModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => coreInjectableModule.secureStorage(),
    );
    gh.lazySingleton<_i361.CancelToken>(
      () => coreInjectableModule.cancelToken(),
    );
    gh.lazySingleton<_i161.InternetConnection>(
      () => coreInjectableModule.internetConnection(),
    );
    gh.singleton<_i23.UserHelper>(
      () => _i23.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i873.SigupApiClient>(
      () => _i873.SigupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i739.SignupRemoteDataSourceContract>(
      () => _i500.SigupRemoteDataSourceImpl(
        homeApiClient: gh<_i873.SigupApiClient>(),
      ),
    );
    gh.factory<_i229.SignupLocalDataSourceContract>(
      () => _i471.SignupLocalDataSourceImpl(
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.singleton<_i449.AppInterceptors>(
      () => _i449.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i1062.SignupRepositoryContract>(
      () => _i527.SignupRepositoryImpl(
        remoteDataSource: gh<_i739.SignupRemoteDataSourceContract>(),
        localDataSource: gh<_i229.SignupLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i1042.SignupUserUsecase>(
      () =>
          _i1042.SignupUserUsecase(repo: gh<_i1062.SignupRepositoryContract>()),
    );
    gh.factory<_i662.SignupCubit>(
      () => _i662.SignupCubit(signupUserCase: gh<_i1042.SignupUserUsecase>()),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
