// TODO: data SignupRepositoryImpl
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/signup/data/datasources/signup_local_data_source.dart';
import 'package:elevate_online_exam/features/signup/data/datasources/signup_remote_data_source.dart';
import 'package:elevate_online_exam/features/signup/data/models/signup_response/signup_response.dart';
import 'package:elevate_online_exam/features/signup/domain/models/signup_post_entity.dart';
import 'package:elevate_online_exam/features/signup/domain/models/user_entity.dart';
import 'package:elevate_online_exam/features/signup/domain/repositories/signup_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRepositoryContract)
class SignupRepositoryImpl implements SignupRepositoryContract {
  final SignupRemoteDataSourceContract remoteDataSource;
  final SignupLocalDataSourceContract localDataSource;

  SignupRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Result<UserEntity>> sigupUser(SignupPostEntity signupPostModel) async {
    final response = await remoteDataSource.signupUser(signupPostModel.toDto());
    switch (response) {
      case Success<SignupResponse>():
        await localDataSource.saveUserToken(response.data?.token ?? "");
        return Success<UserEntity>(data: response.data?.toUserEntity());
      case Error<SignupResponse>():
        return Error<UserEntity>(exception: response.exception);
    }
  }

  // @override
  // Future<Result<UserEntity>> sigupUser(SignupPostModel signupPostModel) async {
  //   final sigupResponse = await remoteDataSource.signupUser(signupPostModel);
  //   switch (sigupResponse) {
  //     case Success<SignupResponse>():
  //       return Success<UserEntity>();
  //     case Error<SignupResponse>():
  //       return Error<UserEntity>(exception: sigupResponse.exception);
  //   }
  // }
}
