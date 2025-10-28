import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../helper/user_helper/user_helper.dart';
import '../di/injectable_config.dart';
import 'end_points.dart';
import 'status_code.dart';

@singleton
class AppInterceptors extends Interceptor {
  final Dio dio;
  final FlutterSecureStorage fss;

  AppInterceptors({required this.dio, required this.fss});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.cancelToken = getIt<CancelToken>();
    String? authToken = await fss.read(key: Apikeys.accessToken);
    if (authToken != null && authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ToDo
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint("err.response?.statusCode ${err.response?.statusCode}");
    if (err.response?.statusCode == StatusCode.expiredToken) {
      String? accessToken = await fss.read(key: Apikeys.accessToken);
      String? refreshToken = await fss.read(key: Apikeys.refreshToken);
      debugPrint(accessToken);
      debugPrint(refreshToken);
      if (refreshToken != null && refreshToken.isNotEmpty) {
        dio.options.baseUrl = EndPoints.baseUrl;
        await dio
            .post(EndPoints.refreshToken, data: {"token": refreshToken})
            .then((value) async {
              debugPrint("value : $value");
              String token = value.data["accessToken"];
              await fss.write(key: Apikeys.accessToken, value: token);
            });
        accessToken = await fss.read(key: Apikeys.accessToken);
        err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
        return handler.resolve(await dio.fetch(err.requestOptions));
      }
    } else if (err.response?.statusCode == StatusCode.forbidden) {
      getIt.get<UserHelper>().clearUserData();
    }
    super.onError(err, handler);
  }
}
