import 'package:dio/dio.dart';

import '../../errors/failures.dart';
import '../base_response/result.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall();
    return Success<T>(data: result);
  } on DioException catch (ex) {
    return Error<T>(
      exception: ServerFailure.fromDioException(dioException: ex),
    );
  } on Exception catch (ex) {
    return Error<T>(exception: ex);
  }
}
