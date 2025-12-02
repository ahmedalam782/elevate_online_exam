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
import 'package:hive/hive.dart' as _i979;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/app_layout/api/api_client/app_layout_api_client.dart'
    as _i551;
import '../../../features/app_layout/api/datasources/app_layout_remote_data_source_impl.dart'
    as _i934;
import '../../../features/app_layout/data/datasources/app_layout_remote_data_source_contract.dart'
    as _i817;
import '../../../features/app_layout/data/repositories/app_layout_repository_impl.dart'
    as _i275;
import '../../../features/app_layout/domain/repositories/app_layout_repository.dart'
    as _i161;
import '../../../features/app_layout/domain/use_cases/logout_use_case.dart'
    as _i936;
import '../../../features/app_layout/presentation/view_model/cubit/app_layout_cubit.dart'
    as _i334;
import '../../../features/exams_tap/api/api_client/exams_tap_api_client.dart'
    as _i384;
import '../../../features/exams_tap/api/datasources/exams_tap_remote_data_source_impl.dart'
    as _i609;
import '../../../features/exams_tap/data/datasources/exams_tap_remote_data_source_contract.dart'
    as _i1040;
import '../../../features/exams_tap/data/models/exam_dto.dart' as _i58;
import '../../../features/exams_tap/data/repositories/exams_tap_repository_impl.dart'
    as _i1004;
import '../../../features/exams_tap/domain/repositories/exams_tap_repository.dart'
    as _i530;
import '../../../features/exams_tap/domain/use_cases/get_exams_on_subject_use_case.dart'
    as _i491;
import '../../../features/exams_tap/presentation/view_model/cubit/exams_tap_cubit.dart'
    as _i91;
import '../../../features/explore/api/api_client/explore_api_client.dart'
    as _i89;
import '../../../features/explore/api/datasources/explore_remote_data_source_impl.dart'
    as _i781;
import '../../../features/explore/data/datasources/explore_remote_data_source_contract.dart'
    as _i568;
import '../../../features/explore/data/repositories/explore_repository_impl.dart'
    as _i712;
import '../../../features/explore/domain/repositories/explore_repository.dart'
    as _i1012;
import '../../../features/explore/domain/use_cases/get_all_subjects_use_case.dart'
    as _i307;
import '../../../features/explore/presentation/view_model/cubit/explore_cubit.dart'
    as _i176;
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
import '../../../features/login/api/api_client/login_api_client.dart' as _i865;
import '../../../features/login/api/datasources/login_local_data_source_impl.dart'
    as _i910;
import '../../../features/login/api/datasources/login_remote_data_source_impl.dart'
    as _i791;
import '../../../features/login/data/datasources/login_local_data_source_contract.dart'
    as _i224;
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
import '../../../features/profile/api/api_client/profile_api_client.dart'
    as _i19;
import '../../../features/profile/api/datasources/profile_local_data_source_impl.dart'
    as _i790;
import '../../../features/profile/api/datasources/profile_remote_data_source_impl.dart'
    as _i394;
import '../../../features/profile/data/datasources/profile_local_data_source_contract.dart'
    as _i991;
import '../../../features/profile/data/datasources/profile_remote_data_source_contract.dart'
    as _i376;
import '../../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i695;
import '../../../features/profile/domain/repositories/profile_repository.dart'
    as _i919;
import '../../../features/profile/domain/use_cases/get_profile_data_use_case.dart'
    as _i874;
import '../../../features/profile/domain/use_cases/update_profile_use_case.dart'
    as _i412;
import '../../../features/profile/presentation/view_model/cubit/profile_cubit.dart'
    as _i683;
import '../../../features/questions/api/api_client/questions_api_client.dart'
    as _i179;
import '../../../features/questions/api/datasources/questions_local_data_source_impl.dart'
    as _i719;
import '../../../features/questions/api/datasources/questions_remote_data_source_impl.dart'
    as _i121;
import '../../../features/questions/data/datasources/questions_local_data_source_contract.dart'
    as _i340;
import '../../../features/questions/data/datasources/questions_remote_data_source_contract.dart'
    as _i810;
import '../../../features/questions/data/models/answer_dto/answer_dto.dart'
    as _i220;
import '../../../features/questions/data/models/question_dto/question_dto.dart'
    as _i112;
import '../../../features/questions/data/models/questions_response/questions_response.dart'
    as _i844;
import '../../../features/questions/data/repositories/questions_repository_impl.dart'
    as _i60;
import '../../../features/questions/domain/repositories/questions_repository.dart'
    as _i258;
import '../../../features/questions/domain/use_cases/get_questions_use_case.dart'
    as _i939;
import '../../../features/questions/domain/use_cases/save_exame_use_case.dart'
    as _i25;
import '../../../features/questions/presentation/view_model/cubit/questions_cubit.dart'
    as _i809;
import '../../../features/result/api/datasources/result_local_data_source_impl.dart'
    as _i339;
import '../../../features/result/data/datasources/result_local_data_source_contract.dart'
    as _i264;
import '../../../features/result/data/repositories/result_repository_impl.dart'
    as _i18;
import '../../../features/result/domain/repositories/result_repository.dart'
    as _i62;
import '../../../features/result/domain/use_case/get_exams_use_case.dart'
    as _i109;
import '../../../features/result/presentation/view_model/cubit/results_cubit.dart'
    as _i251;
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
import '../local/hive_module.dart' as _i383;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreInjectableModule = _$CoreInjectableModule();
    final hiveInjectableModule = _$HiveInjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreInjectableModule.prefs(),
      preResolve: true,
    );
    await gh.factoryAsync<_i986.HiveInterface>(
      () => hiveInjectableModule.hive(),
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
    gh.factory<_i23.UserHelper>(
      () => _i23.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i384.ExamsTapApiClient>(
      () => _i384.ExamsTapApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i865.LoginApiClient>(
      () => _i865.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i179.QuestionsApiClient>(
      () => _i179.QuestionsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i551.AppLayoutApiClient>(
      () => _i551.AppLayoutApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i89.ExploreApiClient>(
      () => _i89.ExploreApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i788.ForgetPasswordApiClient>(
      () => _i788.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i19.ProfileApiClient>(
      () => _i19.ProfileApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i873.SigupApiClient>(
      () => _i873.SigupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i991.ProfileLocalDataSourceContract>(
      () => _i790.ProfileLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i739.SignupRemoteDataSourceContract>(
      () => _i500.SigupRemoteDataSourceImpl(
        homeApiClient: gh<_i873.SigupApiClient>(),
      ),
    );
    gh.factory<_i938.ForgetPasswordRemoteDataSourceContract>(
      () => _i131.ForgetPasswordRemoteDataSourceImpl(
        apiClient: gh<_i788.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i810.QuestionsRemoteDataSourceContract>(
      () => _i121.QuestionsRemoteDataSourceImpl(
        homeApiClient: gh<_i179.QuestionsApiClient>(),
      ),
    );
    await gh.factoryAsync<_i986.Box<_i58.ExamDto>>(
      () => hiveInjectableModule.examsBox(gh<_i986.HiveInterface>()),
      instanceName: 'examsBox',
      preResolve: true,
    );
    gh.factory<_i229.SignupLocalDataSourceContract>(
      () => _i471.SignupLocalDataSourceImpl(
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    await gh.factoryAsync<_i986.Box<_i844.QuestionsResponse>>(
      () =>
          hiveInjectableModule.questionsResponseBox(gh<_i986.HiveInterface>()),
      instanceName: 'questionsResponseBox',
      preResolve: true,
    );
    gh.lazySingleton<_i224.LoginLocalDataSourceContract>(
      () => _i910.LoginLocalDataSourceImpl(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.singleton<_i449.AppInterceptors>(
      () => _i449.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    await gh.factoryAsync<_i986.Box<_i220.AnswerDto>>(
      () => hiveInjectableModule.answersBox(gh<_i986.HiveInterface>()),
      instanceName: 'answersBox',
      preResolve: true,
    );
    gh.factory<_i817.AppLayoutRemoteDataSourceContract>(
      () => _i934.AppLayoutRemoteDataSourceImpl(gh<_i551.AppLayoutApiClient>()),
    );
    gh.factory<_i376.ProfileRemoteDataSourceContract>(
      () => _i394.ProfileRemoteDataSourceImpl(
        gh<_i19.ProfileApiClient>(),
        gh<_i991.ProfileLocalDataSourceContract>(),
      ),
    );
    gh.lazySingleton<_i354.LoginRemoteDataSourceContract>(
      () => _i791.LoginRemoteDataSourceImpl(
        apiClient: gh<_i865.LoginApiClient>(),
      ),
    );
    gh.factory<_i1062.SignupRepositoryContract>(
      () => _i527.SignupRepositoryImpl(
        remoteDataSource: gh<_i739.SignupRemoteDataSourceContract>(),
        localDataSource: gh<_i229.SignupLocalDataSourceContract>(),
      ),
    );
    await gh.factoryAsync<_i986.Box<_i112.QuestionDto>>(
      () => hiveInjectableModule.questionsBox(gh<_i986.HiveInterface>()),
      instanceName: 'questionsBox',
      preResolve: true,
    );
    gh.factory<_i98.ForgetPasswordRepository>(
      () => _i893.ForgetPasswordRepositoryImpl(
        remoteDataSource: gh<_i938.ForgetPasswordRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i264.ResultLocalDataSourceContract>(
      () => _i339.ResultLocalDataSourceImpl(
        examsBox: gh<_i979.Box<_i58.ExamDto>>(instanceName: 'examsBox'),
      ),
    );
    gh.factory<_i340.QuestionsLocalDataSourceContract>(
      () => _i719.QuestionsLocalDataSourceImpl(
        examsBox: gh<_i979.Box<_i58.ExamDto>>(instanceName: 'examsBox'),
      ),
    );
    gh.factory<_i568.ExploreRemoteDataSourceContract>(
      () => _i781.ExploreRemoteDataSourceImpl(gh<_i89.ExploreApiClient>()),
    );
    gh.lazySingleton<_i1040.ExamsTapRemoteDataSourceContract>(
      () => _i609.ExamsTapRemoteDataSourceImpl(
        apiClient: gh<_i384.ExamsTapApiClient>(),
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
    gh.factory<_i1012.ExploreRepository>(
      () => _i712.ExploreRepositoryImpl(
        gh<_i568.ExploreRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i62.ResultRepositoryContract>(
      () => _i18.ResultRepositoryImpl(
        localDataSourceContract: gh<_i264.ResultLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i161.AppLayoutRepository>(
      () => _i275.AppLayoutRepositoryImpl(
        remoteDataSource: gh<_i817.AppLayoutRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i919.ProfileRepository>(
      () => _i695.ProfileRepositoryImpl(
        gh<_i376.ProfileRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i1042.SignupUserUsecase>(
      () =>
          _i1042.SignupUserUsecase(repo: gh<_i1062.SignupRepositoryContract>()),
    );
    gh.factory<_i874.GetProfileDataUseCase>(
      () => _i874.GetProfileDataUseCase(gh<_i919.ProfileRepository>()),
    );
    gh.lazySingleton<_i1053.LoginRepository>(
      () => _i928.LoginRepositoryImpl(
        remoteDataSource: gh<_i354.LoginRemoteDataSourceContract>(),
        localDataSource: gh<_i224.LoginLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i936.LogoutUseCase>(
      () => _i936.LogoutUseCase(gh<_i161.AppLayoutRepository>()),
    );
    gh.factory<_i109.GetExamsUseCase>(
      () => _i109.GetExamsUseCase(repo: gh<_i62.ResultRepositoryContract>()),
    );
    gh.factory<_i307.GetAllSubjectsUseCase>(
      () => _i307.GetAllSubjectsUseCase(gh<_i1012.ExploreRepository>()),
    );
    gh.lazySingleton<_i251.ResultsCubit>(
      () => _i251.ResultsCubit(getExamsUseCase: gh<_i109.GetExamsUseCase>()),
    );
    gh.factory<_i258.QuestionsRepositoryContract>(
      () => _i60.QuestionsRepositoryImpl(
        questionsLocalDataSource: gh<_i340.QuestionsLocalDataSourceContract>(),
        questionsRemoteDataSource:
            gh<_i810.QuestionsRemoteDataSourceContract>(),
      ),
    );
    gh.lazySingleton<_i530.ExamsTapRepository>(
      () => _i1004.ExamsTapRepositoryImpl(
        examsTapRemoteDataSourceContract:
            gh<_i1040.ExamsTapRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i412.UpdateProfileUseCase>(
      () => _i412.UpdateProfileUseCase(gh<_i919.ProfileRepository>()),
    );
    gh.factory<_i70.ForgetPasswordCubit>(
      () => _i70.ForgetPasswordCubit(
        gh<_i351.ForgetPasswordUseCase>(),
        gh<_i677.VerifyResetCodeUseCase>(),
        gh<_i514.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i939.GetQuestionsUseCase>(
      () => _i939.GetQuestionsUseCase(
        repo: gh<_i258.QuestionsRepositoryContract>(),
      ),
    );
    gh.factory<_i25.SaveExameUseCase>(
      () =>
          _i25.SaveExameUseCase(repo: gh<_i258.QuestionsRepositoryContract>()),
    );
    gh.lazySingleton<_i571.LoginUserUseCase>(
      () => _i571.LoginUserUseCase(repository: gh<_i1053.LoginRepository>()),
    );
    gh.factory<_i334.AppLayoutCubit>(
      () => _i334.AppLayoutCubit(gh<_i936.LogoutUseCase>()),
    );
    gh.factory<_i662.SignupCubit>(
      () => _i662.SignupCubit(signupUserCase: gh<_i1042.SignupUserUsecase>()),
    );
    gh.lazySingleton<_i491.GetExamsOnSubjectUseCase>(
      () => _i491.GetExamsOnSubjectUseCase(gh<_i530.ExamsTapRepository>()),
    );
    gh.factory<_i176.ExploreCubit>(
      () => _i176.ExploreCubit(gh<_i307.GetAllSubjectsUseCase>()),
    );
    gh.factory<_i199.LoginCubit>(
      () => _i199.LoginCubit(gh<_i571.LoginUserUseCase>()),
    );
    gh.factory<_i91.ExamsTapCubit>(
      () => _i91.ExamsTapCubit(gh<_i491.GetExamsOnSubjectUseCase>()),
    );
    gh.factory<_i683.ProfileCubit>(
      () => _i683.ProfileCubit(
        gh<_i874.GetProfileDataUseCase>(),
        gh<_i412.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i809.QuestionsCubit>(
      () => _i809.QuestionsCubit(
        questionsUseCase: gh<_i939.GetQuestionsUseCase>(),
        saveExameUseCase: gh<_i25.SaveExameUseCase>(),
      ),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}

class _$HiveInjectableModule extends _i383.HiveInjectableModule {}
