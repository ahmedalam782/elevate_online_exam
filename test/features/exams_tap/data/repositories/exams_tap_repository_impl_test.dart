import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/exams_tap/api/datasources/exams_tap_remote_data_source_impl.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exam_query_params.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exams_response_dto.dart';
import 'package:elevate_online_exam/features/exams_tap/data/repositories/exams_tap_repository_impl.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exams_tap_repository_impl_test.mocks.dart';
// AAA
// Arrange, Act, Assert

@GenerateMocks([ExamsTapRemoteDataSourceImpl])
void main() {
  late ExamsTapRepositoryImpl examsTapRepositoryImpl;
  late MockExamsTapRemoteDataSourceImpl mockExamsTapRemoteDataSourceImpl;
  late ExamQueryParams params;
  setUpAll(() {
    mockExamsTapRemoteDataSourceImpl = MockExamsTapRemoteDataSourceImpl();
    examsTapRepositoryImpl = ExamsTapRepositoryImpl(
      examsTapRemoteDataSourceContract: mockExamsTapRemoteDataSourceImpl,
    );
    params = ExamQueryParams(page: 1, subjectId: "1");
  });

  group("ExamsTapRepositoryImpl - getExams", () {
    test("test success with empty data", () async {
      final ExamsResponseDto emptyMockExamsResponseDto = ExamsResponseDto(
        message: "success",
        metadata: Metadata(currentPage: 1, numberOfPages: 0, limit: 40),
        exams: [],
      );
      provideDummy<Result<ExamsResponseDto>>(
        Success<ExamsResponseDto>(data: emptyMockExamsResponseDto),
      );
      when(
        mockExamsTapRemoteDataSourceImpl.getExams(queries: anyNamed("queries")),
      ).thenAnswer(
        (_) async => Success<ExamsResponseDto>(data: emptyMockExamsResponseDto),
      );

      final result = await examsTapRepositoryImpl.getExams(
        subjectId: "1",
        page: 1,
      );

      expect(result, isA<Success<PaginatedExams>>());
      final success = result as Success<PaginatedExams>;
      expect(success.data?.exams.length, isZero);
      expect(success.data?.totalPages, equals(0));
      verify(
        mockExamsTapRemoteDataSourceImpl.getExams(queries: params.toMap()),
      );
    });

    test("test success with data", () async {
      // arrange
      ExamsResponseDto examsResponseDto = ExamsResponseDto(
        message: "success",
        exams: [
          ExamDto(id: "1", title: "title", subject: "1"),
          ExamDto(id: "2", title: "title2", subject: "1"),
        ],
        metadata: Metadata(currentPage: 1, numberOfPages: 1, limit: 40),
      );
      provideDummy<Result<ExamsResponseDto>>(
        Success<ExamsResponseDto>(data: examsResponseDto),
      );
      when(
        mockExamsTapRemoteDataSourceImpl.getExams(queries: anyNamed("queries")),
      ).thenAnswer(
        (_) async => Success<ExamsResponseDto>(data: examsResponseDto),
      );
      // act
      final result = await examsTapRepositoryImpl.getExams(
        subjectId: "1",
        page: 1,
      );
      // assert
      expect(result, isA<Success<PaginatedExams>>());
      final success = result as Success<PaginatedExams>;
      expect(success.data?.exams.length, examsResponseDto.exams?.length);
      expect(success.data?.exams.first.id, examsResponseDto.exams?.first.id);
      expect(
        success.data?.exams.first.title,
        examsResponseDto.exams?.first.title,
      );
      expect(success.data?.currentPage, examsResponseDto.metadata?.currentPage);
      expect(
        success.data?.totalPages,
        examsResponseDto.metadata?.numberOfPages,
      );
      verify(
        mockExamsTapRemoteDataSourceImpl.getExams(queries: params.toMap()),
      ).called(1);
    });

    test("test error case", () async {
      provideDummy<Result<ExamsResponseDto>>(
        Error<ExamsResponseDto>(exception: Exception("error")),
      );
      when(
        mockExamsTapRemoteDataSourceImpl.getExams(queries: anyNamed("queries")),
      ).thenAnswer(
        (_) async => Error<ExamsResponseDto>(exception: Exception("error")),
      );

      final result = await examsTapRepositoryImpl.getExams(
        subjectId: "1",
        page: 1,
      );

      expect(result, isA<Error<PaginatedExams>>());
      final error = result as Error<PaginatedExams>;
      expect(error.exception.toString(), contains("error"));
      verify(
        mockExamsTapRemoteDataSourceImpl.getExams(queries: params.toMap()),
      ).called(1);
    });
  });
}
