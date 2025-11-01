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

import '../../../features/forget_password/api/api_client/forget_password_api_client.dart'
    as _i788;
import '../../../features/forget_password/api/datasources/forget_password_remote_data_source_impl.dart'
    as _i131;
import '../../../features/forget_password/data/datasources/forget_password_remote_data_source_contract.dart'
    as _i938;
import '../../../features/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i893;
import '../../../features/forget_password/domain/repositories/forget_password_repository.dart'
    as _i98;
import '../../../features/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i351;
import '../../../features/forget_password/domain/use_cases/reset_password_use_case.dart'
    as _i514;
import '../../../features/forget_password/domain/use_cases/verify_reset_code_use_case.dart'
    as _i677;
import '../../../features/forget_password/presentation/view_model/cubit/forget_password_cubit.dart'
    as _i70;
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
    gh.factory<_i788.ForgetPasswordApiClient>(
      () => _i788.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i938.ForgetPasswordRemoteDataSourceContract>(
      () => _i131.ForgetPasswordRemoteDataSourceImpl(
        apiClient: gh<_i788.ForgetPasswordApiClient>(),
      ),
    );
    gh.singleton<_i449.AppInterceptors>(
      () => _i449.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i98.ForgetPasswordRepository>(
      () => _i893.ForgetPasswordRepositoryImpl(
        remoteDataSource: gh<_i938.ForgetPasswordRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i351.ForgetPasswordUseCase>(
      () => _i351.ForgetPasswordUseCase(
        repository: gh<_i98.ForgetPasswordRepository>(),
      ),
    );
    gh.factory<_i514.ResetPasswordUseCase>(
      () => _i514.ResetPasswordUseCase(gh<_i98.ForgetPasswordRepository>()),
    );
    gh.factory<_i677.VerifyResetCodeUseCase>(
      () => _i677.VerifyResetCodeUseCase(gh<_i98.ForgetPasswordRepository>()),
    );
    gh.factory<_i70.ForgetPasswordCubit>(
      () => _i70.ForgetPasswordCubit(
        gh<_i351.ForgetPasswordUseCase>(),
        gh<_i677.VerifyResetCodeUseCase>(),
        gh<_i514.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
