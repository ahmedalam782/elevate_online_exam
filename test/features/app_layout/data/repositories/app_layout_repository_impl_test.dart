import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/app_layout/data/datasources/app_layout_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/app_layout/data/repositories/app_layout_repository_impl.dart';
import 'package:elevate_online_exam/features/app_layout/domain/repositories/app_layout_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_layout_repository_impl_test.mocks.dart';

// Generate mocks for the following classes
@GenerateMocks([AppLayoutRemoteDataSourceContract])
void main() {
  late AppLayoutRepository repository;
  late MockAppLayoutRemoteDataSourceContract mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAppLayoutRemoteDataSourceContract();
    repository = AppLayoutRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );

    // Provide dummy value for Result type
    provideDummy<Result<void>>(const Success(data: null));
  });

  group('logout', () {
    test(
      'should return Success when remote data source returns Success',
      () async {
        // Arrange
        const tResult = Success<void>(data: null);
        when(mockRemoteDataSource.logout()).thenAnswer((_) async => tResult);

        // Act
        final result = await repository.logout();

        // Assert
        expect(result, isA<Success<void>>());
        verify(mockRemoteDataSource.logout()).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test('should return Error when remote data source returns Error', () async {
      // Arrange
      final tException = Exception('Logout failed');
      final tResult = Error<void>(exception: tException);
      when(mockRemoteDataSource.logout()).thenAnswer((_) async => tResult);

      // Act
      final result = await repository.logout();

      // Assert
      expect(result, isA<Error<void>>());
      expect((result as Error).exception, tException);
      verify(mockRemoteDataSource.logout()).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test(
      'should return Error when remote data source throws an exception',
      () async {
        // Arrange
        final tException = Exception('Network error');
        when(mockRemoteDataSource.logout()).thenThrow(tException);

        // Act & Assert
        expect(() => repository.logout(), throwsA(tException));
        verify(mockRemoteDataSource.logout()).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );
  });
}
