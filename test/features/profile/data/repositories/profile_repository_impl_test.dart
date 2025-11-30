import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/helper/classes/params.dart';
import 'package:elevate_online_exam/features/profile/data/datasources/profile_remote_data_source_contract.dart';
import 'package:elevate_online_exam/features/profile/data/models/profile_model/user.dart';
import 'package:elevate_online_exam/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:elevate_online_exam/features/profile/domain/entities/user_entity.dart';
import 'package:elevate_online_exam/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repository_impl_test.mocks.dart';

// Generate mocks for the following classes
@GenerateMocks([ProfileRemoteDataSourceContract])
void main() {
  late ProfileRepository repository;
  late MockProfileRemoteDataSourceContract mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockProfileRemoteDataSourceContract();
    repository = ProfileRepositoryImpl(mockRemoteDataSource);

    // Provide dummy values for Result types
    provideDummy<Result<User>>(const Success(data: null));
    provideDummy<Result<UserEntity>>(
      Success(
        data: UserEntity(
          userName: '',
          email: '',
          phone: '',
          firstName: '',
          lastName: '',
        ),
      ),
    );
  });

  group('getProfileData', () {
    test(
      'should return Success with UserEntity when remote data source returns Success with data',
      () async {
        // Arrange
        const tUser = User(
          id: '1',
          username: 'john_doe',
          firstName: 'John',
          lastName: 'Doe',
          email: 'john@example.com',
          phone: '01234567890',
          role: 'student',
          isVerified: true,
        );
        const tResult = Success<User>(data: tUser);
        when(
          mockRemoteDataSource.getProfileData(),
        ).thenAnswer((_) async => tResult);

        // Act
        final result = await repository.getProfileData();

        // Assert
        expect(result, isA<Success<UserEntity>>());
        final successResult = result as Success<UserEntity>;
        expect(successResult.data?.userName, 'john_doe');
        expect(successResult.data?.firstName, 'John');
        expect(successResult.data?.lastName, 'Doe');
        expect(successResult.data?.email, 'john@example.com');
        expect(successResult.data?.phone, '01234567890');
        verify(mockRemoteDataSource.getProfileData()).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Success with null UserEntity when remote data source returns Success with null data',
      () async {
        // Arrange
        const tResult = Success<User>(data: null);
        when(
          mockRemoteDataSource.getProfileData(),
        ).thenAnswer((_) async => tResult);

        // Act
        final result = await repository.getProfileData();

        // Assert
        expect(result, isA<Success<UserEntity>>());
        final successResult = result as Success<UserEntity>;
        expect(successResult.data, isNull);
        verify(mockRemoteDataSource.getProfileData()).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test('should return Error when remote data source returns Error', () async {
      // Arrange
      final tException = Exception('Failed to get profile data');
      final tResult = Error<User>(exception: tException);
      when(
        mockRemoteDataSource.getProfileData(),
      ).thenAnswer((_) async => tResult);

      // Act
      final result = await repository.getProfileData();

      // Assert
      expect(result, isA<Error<UserEntity>>());
      expect((result as Error).exception, tException);
      verify(mockRemoteDataSource.getProfileData()).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('updateProfileData', () {
    const tParams = EditProfileParams(
      username: 'john_updated',
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.updated@example.com',
      phone: '01234567890',
    );

    test(
      'should return Success with UserEntity when remote data source returns Success with data',
      () async {
        // Arrange
        const tUser = User(
          id: '1',
          username: 'john_updated',
          firstName: 'John',
          lastName: 'Doe',
          email: 'john.updated@example.com',
          phone: '01234567890',
          role: 'student',
          isVerified: true,
        );
        const tResult = Success<User>(data: tUser);
        when(
          mockRemoteDataSource.updateProfileData(tParams),
        ).thenAnswer((_) async => tResult);

        // Act
        final result = await repository.updateProfileData(tParams);

        // Assert
        expect(result, isA<Success<UserEntity>>());
        final successResult = result as Success<UserEntity>;
        expect(successResult.data?.userName, 'john_updated');
        expect(successResult.data?.firstName, 'John');
        expect(successResult.data?.lastName, 'Doe');
        expect(successResult.data?.email, 'john.updated@example.com');
        expect(successResult.data?.phone, '01234567890');
        verify(mockRemoteDataSource.updateProfileData(tParams)).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Success with null UserEntity when remote data source returns Success with null data',
      () async {
        // Arrange
        const tResult = Success<User>(data: null);
        when(
          mockRemoteDataSource.updateProfileData(tParams),
        ).thenAnswer((_) async => tResult);

        // Act
        final result = await repository.updateProfileData(tParams);

        // Assert
        expect(result, isA<Success<UserEntity>>());
        final successResult = result as Success<UserEntity>;
        expect(successResult.data, isNull);
        verify(mockRemoteDataSource.updateProfileData(tParams)).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test('should return Error when remote data source returns Error', () async {
      // Arrange
      final tException = Exception('Failed to update profile data');
      final tResult = Error<User>(exception: tException);
      when(
        mockRemoteDataSource.updateProfileData(tParams),
      ).thenAnswer((_) async => tResult);

      // Act
      final result = await repository.updateProfileData(tParams);

      // Assert
      expect(result, isA<Error<UserEntity>>());
      expect((result as Error).exception, tException);
      verify(mockRemoteDataSource.updateProfileData(tParams)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should handle partial updates correctly', () async {
      // Arrange
      const tPartialParams = EditProfileParams(
        username: 'john_partial',
        email: 'john.partial@example.com',
      );
      const tUser = User(
        id: '1',
        username: 'john_partial',
        email: 'john.partial@example.com',
        role: 'student',
        isVerified: true,
      );
      const tResult = Success<User>(data: tUser);
      when(
        mockRemoteDataSource.updateProfileData(tPartialParams),
      ).thenAnswer((_) async => tResult);

      // Act
      final result = await repository.updateProfileData(tPartialParams);

      // Assert
      expect(result, isA<Success<UserEntity>>());
      final successResult = result as Success<UserEntity>;
      expect(successResult.data?.userName, 'john_partial');
      expect(successResult.data?.email, 'john.partial@example.com');
      verify(mockRemoteDataSource.updateProfileData(tPartialParams)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
