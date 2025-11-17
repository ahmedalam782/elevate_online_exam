import 'package:dio/dio.dart';
import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/errors/failures.dart';
import 'package:elevate_online_exam/features/exams_tap/api/api_client/exams_tap_api_client.dart';
import 'package:elevate_online_exam/features/exams_tap/api/datasources/exams_tap_remote_data_source_impl.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exams_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'exams_tap_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ExamsTapApiClient])
void main() {
  late ExamsTapRemoteDataSourceImpl examsTapRemoteDataSourceImpl;
  late MockExamsTapApiClient mockExamsTapApiClient;

  setUpAll(() {
    mockExamsTapApiClient = MockExamsTapApiClient();
    examsTapRemoteDataSourceImpl = ExamsTapRemoteDataSourceImpl(
      apiClient: mockExamsTapApiClient,
    );
  });

  group("Remote Data Source getExams test", () {
    final queries = {"subject": "1", "page": 1};
    test("returns Success when API call succeeds", () async {
      final sucessDummyData = ExamsResponseDto(
        message: "success",
        metadata: Metadata(currentPage: 1, numberOfPages: 0, limit: 40),
        exams: [],
      );
      provideDummy<Result<ExamsResponseDto>>(Success(data: sucessDummyData));
      when(
        mockExamsTapApiClient.getExams(queries),
      ).thenAnswer((_) async => sucessDummyData);

      final result = await examsTapRemoteDataSourceImpl.getExams(
        queries: queries,
      );

      expect(result, isA<Success<ExamsResponseDto>>());
      final sucess = result as Success<ExamsResponseDto>;
      expect(sucess.data?.message, equals("success"));
      verify(mockExamsTapApiClient.getExams(queries)).called(1);
    });

    test("returns Error server failure when API call fails", () async {
      when(
        mockExamsTapApiClient.getExams(queries),
      ).thenThrow(DioException(requestOptions: RequestOptions(path: "/test")));
      final result = await examsTapRemoteDataSourceImpl.getExams(
        queries: queries,
      );

      expect(result, isA<Error<ExamsResponseDto>>());
      final error = result as Error<ExamsResponseDto>;
      expect(error.exception, isA<ServerFailure>());
      verify(mockExamsTapApiClient.getExams(queries)).called(1);
    });

    test("returns Error when normal exception is thrown", () async {
      when(
        mockExamsTapApiClient.getExams(queries),
      ).thenThrow(Exception("test"));

      final result = await examsTapRemoteDataSourceImpl.getExams(
        queries: queries,
      );
      expect(result, isA<Error<ExamsResponseDto>>());
      final error = result as Error<ExamsResponseDto>;
      expect(error.exception, isA<Exception>());
      expect(error.exception.toString(), contains("test"));
      verify(mockExamsTapApiClient.getExams(queries)).called(1);
    });

    test("test api call with correct parameters", () async{
      when(
        mockExamsTapApiClient.getExams(queries),
      ).thenAnswer((_) async => ExamsResponseDto(
            message: "success",
            metadata: Metadata(currentPage: 1, numberOfPages: 0, limit: 40),
            exams: [],
      ));

      final result = await examsTapRemoteDataSourceImpl.getExams(queries:queries);

      expect(result, isA<Success<ExamsResponseDto>>());
      final sucess = result as Success<ExamsResponseDto>;
      expect(sucess.data?.message, equals("success"));
      verify(mockExamsTapApiClient.getExams(queries)).called(1);
    }); 
  });
}
