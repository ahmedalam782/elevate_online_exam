// TODO: api SignupRemoteDataSourceImpl

import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/config/api/api_executer.dart';
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/signup/api/api_client/sigup_api_client.dart';
import 'package:elevate_online_exam/features/signup/data/datasources/signup_remote_data_source.dart';
import 'package:elevate_online_exam/features/signup/data/models/signup_post_model/signup_post_dto.dart';
import 'package:elevate_online_exam/features/signup/data/models/signup_response/signup_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRemoteDataSourceContract)
class SigupRemoteDataSourceImpl implements SignupRemoteDataSourceContract {
  final SigupApiClient homeApiClient;

  SigupRemoteDataSourceImpl({required this.homeApiClient});

  @override
  Future<Result<SignupResponse>> signupUser(
    SignupPostDto signupPostModel,
  ) async {
    return await executeApi<SignupResponse>(() async {
      final response = await homeApiClient.signupUser(signupPostModel);
      return response;
    });
  }
}
