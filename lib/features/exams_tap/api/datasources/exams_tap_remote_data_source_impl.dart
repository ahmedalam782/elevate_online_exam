import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/errors/failures.dart';
import 'package:elevate_online_exam/features/exams_tap/api/api_client/exams_tap_api_client.dart';
import 'package:elevate_online_exam/features/exams_tap/data/datasources/exams_tap_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exams_response_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ExamsTapRemoteDataSourceContract)
class ExamsTapRemoteDataSourceImpl implements ExamsTapRemoteDataSourceContract {
  ExamsTapRemoteDataSourceImpl({required this.apiClient});
  final ExamsTapApiClient apiClient;
  @override
  Future<Result<ExamsResponseDto>> getExams({required Map<String, dynamic> queries}) async{

try {
      final response = await apiClient.getExams(queries);
      return Success<ExamsResponseDto>(data: response);
    } on DioException catch (dioException) {
      return Error<ExamsResponseDto>(
        exception: ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (e) {
      return Error<ExamsResponseDto>(exception: e as Exception);
    }
  }

  

  

}
