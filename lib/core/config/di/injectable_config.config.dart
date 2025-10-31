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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/login/api/api_client/api_client.dart' as _i886;
import '../../../features/login/api/datasources/login_remote_data_source_impl.dart'
    as _i791;
import '../../../features/login/data/datasources/login_remote_data_source_contract.dart'
    as _i354;
import '../../../features/login/data/repositories/login_repository_impl.dart'
    as _i928;
import '../../../features/login/domain/repositories/login_repository.dart'
    as _i1053;
import '../../../features/login/domain/use_cases/login_user_use_case.dart'
    as _i571;
import '../../../features/login/presentation/view_model/cubit/login_cubit.dart'
    as _i199;
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
    gh.singleton<_i23.UserHelper>(
      () => _i23.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i886.LoginApiClient>(
      () => _i886.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i354.LoginRemoteDataSourceContract>(
      () => _i791.LoginRemoteDataSourceImpl(
        apiClient: gh<_i886.LoginApiClient>(),
      ),
    );
    gh.lazySingleton<_i1053.LoginRepository>(
      () => _i928.LoginRepositoryImpl(
        remoteDataSource: gh<_i354.LoginRemoteDataSourceContract>(),
      ),
    );
    gh.singleton<_i449.AppInterceptors>(
      () => _i449.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i571.LoginUserUseCase>(
      () => _i571.LoginUserUseCase(repository: gh<_i1053.LoginRepository>()),
    );
    gh.factory<_i199.LoginCubit>(
      () => _i199.LoginCubit(gh<_i571.LoginUserUseCase>()),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
