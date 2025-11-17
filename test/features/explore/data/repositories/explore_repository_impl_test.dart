import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/helper/classes/params.dart';
import 'package:elevate_online_exam/features/explore/data/datasources/explore_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/explore/data/models/subjects_model/subject.dart';
import 'package:elevate_online_exam/features/explore/data/repositories/explore_repository_impl.dart';
import 'package:elevate_online_exam/features/explore/domain/entities/subject_entities.dart';
import 'package:elevate_online_exam/features/explore/domain/repositories/explore_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'explore_repository_impl_test.mocks.dart';

// Generate mocks for the following classes
@GenerateMocks([ExploreRemoteDataSourceContract])
void main() {
  late ExploreRepository repository;
  late MockExploreRemoteDataSourceContract mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockExploreRemoteDataSourceContract();
    repository = ExploreRepositoryImpl(mockRemoteDataSource);

    // Provide dummy value for Result type
    provideDummy<Result<List<Subject>>>(const Success(data: <Subject>[]));
  });

  group('getSubjects', () {
    const tPaginationParams = PaginationParams(page: 1, limit: 10);

    test(
      'should return Success with list of SubjectEntities when remote data source returns Success with data',
      () async {
        // Arrange
        final tSubjects = [
          const Subject(
            id: '1',
            name: 'Mathematics',
            icon: 'math_icon',
            createdAt: null,
          ),
          const Subject(
            id: '2',
            name: 'Physics',
            icon: 'physics_icon',
            createdAt: null,
          ),
          const Subject(
            id: '3',
            name: 'Chemistry',
            icon: 'chemistry_icon',
            createdAt: null,
          ),
        ];

        final tExpectedEntities = tSubjects.map((s) => s.toEntity()).toList();

        when(
          mockRemoteDataSource.getSubjects(tPaginationParams),
        ).thenAnswer((_) async => Success(data: tSubjects));

        // Act
        final result = await repository.getSubjects(tPaginationParams);

        // Assert
        expect(result, isA<Success<List<SubjectEntities>>>());
        expect(
          (result as Success<List<SubjectEntities>>).data,
          tExpectedEntities,
        );
        verify(mockRemoteDataSource.getSubjects(tPaginationParams)).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Success with empty list when remote data source returns Success with empty list',
      () async {
        // Arrange
        final tSubjects = <Subject>[];

        when(
          mockRemoteDataSource.getSubjects(tPaginationParams),
        ).thenAnswer((_) async => Success(data: tSubjects));

        // Act
        final result = await repository.getSubjects(tPaginationParams);

        // Assert
        expect(result, isA<Success<List<SubjectEntities>>>());
        expect((result as Success<List<SubjectEntities>>).data, isEmpty);
        verify(mockRemoteDataSource.getSubjects(tPaginationParams)).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Success with empty list when remote data source returns Success with null data',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getSubjects(tPaginationParams),
        ).thenAnswer((_) async => const Success<List<Subject>>(data: null));

        // Act
        final result = await repository.getSubjects(tPaginationParams);

        // Assert
        expect(result, isA<Success<List<SubjectEntities>>>());
        expect((result as Success<List<SubjectEntities>>).data, isNull);
        verify(mockRemoteDataSource.getSubjects(tPaginationParams)).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test('should return Error when remote data source returns Error', () async {
      // Arrange
      final tException = Exception('Network error');

      when(
        mockRemoteDataSource.getSubjects(tPaginationParams),
      ).thenAnswer((_) async => Error(exception: tException));

      // Act
      final result = await repository.getSubjects(tPaginationParams);

      // Assert
      expect(result, isA<Error<List<SubjectEntities>>>());
      expect((result as Error<List<SubjectEntities>>).exception, tException);
      verify(mockRemoteDataSource.getSubjects(tPaginationParams)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test(
      'should return Error with null exception when remote data source returns Error with null exception',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getSubjects(tPaginationParams),
        ).thenAnswer((_) async => const Error<List<Subject>>(exception: null));

        // Act
        final result = await repository.getSubjects(tPaginationParams);

        // Assert
        expect(result, isA<Error<List<SubjectEntities>>>());
        expect((result as Error<List<SubjectEntities>>).exception, isNull);
        verify(mockRemoteDataSource.getSubjects(tPaginationParams)).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should correctly map Subject with all fields to SubjectEntities',
      () async {
        // Arrange
        final tSubject = [
          Subject(
            id: 'test-id-123',
            name: 'Computer Science',
            icon: 'cs_icon',
            createdAt: DateTime(2024, 1, 15),
          ),
        ];

        final tExpectedEntity = const SubjectEntities(
          id: 'test-id-123',
          name: 'Computer Science',
          icon: 'cs_icon',
        );

        when(
          mockRemoteDataSource.getSubjects(tPaginationParams),
        ).thenAnswer((_) async => Success(data: tSubject));

        // Act
        final result = await repository.getSubjects(tPaginationParams);

        // Assert
        expect(result, isA<Success<List<SubjectEntities>>>());
        final entities = (result as Success<List<SubjectEntities>>).data!;
        expect(entities.length, 1);
        expect(entities.first, tExpectedEntity);
        verify(mockRemoteDataSource.getSubjects(tPaginationParams)).called(1);
      },
    );

    test(
      'should handle Subject with null fields and convert to empty strings in SubjectEntities',
      () async {
        // Arrange
        final tSubjects = [
          const Subject(id: null, name: null, icon: null, createdAt: null),
        ];

        final tExpectedEntity = const SubjectEntities(
          id: '',
          name: '',
          icon: '',
        );

        when(
          mockRemoteDataSource.getSubjects(tPaginationParams),
        ).thenAnswer((_) async => Success(data: tSubjects));

        // Act
        final result = await repository.getSubjects(tPaginationParams);

        // Assert
        expect(result, isA<Success<List<SubjectEntities>>>());
        final entities = (result as Success<List<SubjectEntities>>).data!;
        expect(entities.length, 1);
        expect(entities.first, tExpectedEntity);
        verify(mockRemoteDataSource.getSubjects(tPaginationParams)).called(1);
      },
    );

    test('should handle multiple pagination parameters correctly', () async {
      // Arrange
      const tPaginationParams2 = PaginationParams(page: 2, limit: 20);
      final tSubjects = [
        const Subject(id: '4', name: 'Biology', icon: 'bio_icon'),
      ];

      when(
        mockRemoteDataSource.getSubjects(tPaginationParams2),
      ).thenAnswer((_) async => Success(data: tSubjects));

      // Act
      final result = await repository.getSubjects(tPaginationParams2);

      // Assert
      expect(result, isA<Success<List<SubjectEntities>>>());
      expect((result as Success<List<SubjectEntities>>).data?.length, 1);
      verify(mockRemoteDataSource.getSubjects(tPaginationParams2)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
