import 'dart:io';

import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/profile/domain/entities/user_entity.dart';
import 'package:elevate_online_exam/features/profile/domain/use_cases/get_profile_data_use_case.dart';
import 'package:elevate_online_exam/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:elevate_online_exam/features/profile/presentation/view_model/cubit/profile_cubit.dart';
import 'package:elevate_online_exam/features/profile/presentation/view_model/cubit/profile_events.dart';
import 'package:elevate_online_exam/features/profile/presentation/view_model/cubit/profile_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../view_model/cubit/profile_cubit_test.mocks.dart';

// Generate mocks for the following classes
@GenerateMocks([GetProfileDataUseCase, UpdateProfileUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProfileCubit cubit;
  late MockGetProfileDataUseCase mockGetProfileDataUseCase;
  late MockUpdateProfileUseCase mockUpdateProfileUseCase;

  setUp(() {
    mockGetProfileDataUseCase = MockGetProfileDataUseCase();
    mockUpdateProfileUseCase = MockUpdateProfileUseCase();
    cubit = ProfileCubit(mockGetProfileDataUseCase, mockUpdateProfileUseCase);

    // Provide dummy values for Result types
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

  tearDown(() {
    cubit.close();
  });

  group('GetProfileDataEvent', () {
    final tUserEntity = UserEntity(
      userName: 'john_doe',
      firstName: 'John',
      lastName: 'Doe',
      email: 'john@example.com',
      phone: '01234567890',
    );

    test(
      'should emit loading state then success state when getting profile data succeeds',
      () async {
        // Arrange
        final tResult = Success<UserEntity>(data: tUserEntity);
        when(mockGetProfileDataUseCase()).thenAnswer((_) async => tResult);

        // Collect emitted states
        final states = <ProfileStates>[];
        final subscription = cubit.stream.listen(states.add);

        // Act
        cubit.doIntent(GetProfileDataEvent());

        // Wait for async operation
        await untilCalled(mockGetProfileDataUseCase());
        await Future.delayed(Duration.zero); // Allow all states to emit

        // Assert
        expect(states.length, greaterThanOrEqualTo(2));
        expect(states.first.getProfileDataState?.state, StateType.loading);
        expect(states.last.getProfileDataState?.state, StateType.success);
        expect(states.last.getProfileDataState?.data, tUserEntity);
        expect(states.last.profileDataChangeState?.isChanged, false);

        // Verify controllers are populated
        expect(cubit.userNameController.text, 'john_doe');
        expect(cubit.firstNameController.text, 'John');
        expect(cubit.lastNameController.text, 'Doe');
        expect(cubit.emailController.text, 'john@example.com');
        expect(cubit.phoneController.text, '01234567890');
        expect(cubit.passwordController.text, '*********');

        verify(mockGetProfileDataUseCase()).called(1);

        // Cleanup
        await subscription.cancel();
      },
    );

    test(
      'should emit loading state then error state when getting profile data fails',
      () async {
        // Arrange
        final tException = Exception('Failed to get profile data');
        final tResult = Error<UserEntity>(exception: tException);
        when(mockGetProfileDataUseCase()).thenAnswer((_) async => tResult);

        // Collect emitted states
        final states = <ProfileStates>[];
        final subscription = cubit.stream.listen(states.add);

        // Act
        cubit.doIntent(GetProfileDataEvent());

        // Wait for async operation
        await untilCalled(mockGetProfileDataUseCase());
        await Future.delayed(Duration.zero); // Allow all states to emit

        // Assert
        expect(states.length, greaterThanOrEqualTo(2));
        expect(states.first.getProfileDataState?.state, StateType.loading);
        expect(states.last.getProfileDataState?.state, StateType.error);
        expect(states.last.getProfileDataState?.exception, tException);
        verify(mockGetProfileDataUseCase()).called(1);

        // Cleanup
        await subscription.cancel();
      },
    );

    test('should handle null values in user entity gracefully', () async {
      // Arrange
      final tUserWithNulls = UserEntity(
        userName: '',
        firstName: '',
        lastName: '',
        email: '',
        phone: '',
      );
      final tResult = Success<UserEntity>(data: tUserWithNulls);
      when(mockGetProfileDataUseCase()).thenAnswer((_) async => tResult);

      // Collect emitted states
      final states = <ProfileStates>[];
      final subscription = cubit.stream.listen(states.add);

      // Act
      cubit.doIntent(GetProfileDataEvent());

      // Wait for async operation
      await untilCalled(mockGetProfileDataUseCase());

      // Assert
      expect(cubit.userNameController.text, '');
      expect(cubit.firstNameController.text, '');
      expect(cubit.lastNameController.text, '');
      expect(cubit.emailController.text, '');
      expect(cubit.phoneController.text, '');
      verify(mockGetProfileDataUseCase()).called(1);

      // Cleanup
      await subscription.cancel();
    });
  });

  group('ChangeProfileImageEvent', () {
    test(
      'should emit state with new image path when image is changed',
      () async {
        // Arrange
        final tImageFile = File('path/to/image.jpg');

        // Assert later
        expectLater(
          cubit.stream,
          emits(
            predicate<ProfileStates>(
              (state) =>
                  state.changeProfileImageState?.imagePath.path ==
                  tImageFile.path,
            ),
          ),
        );

        // Act
        cubit.doIntent(ChangeProfileImageEvent(imagePath: tImageFile));
      },
    );

    test('should update image path multiple times', () async {
      // Arrange
      final tImageFile1 = File('path/to/image1.jpg');
      final tImageFile2 = File('path/to/image2.jpg');

      // Collect emitted states
      final states = <ProfileStates>[];
      final subscription = cubit.stream.listen(states.add);

      // Act
      cubit.doIntent(ChangeProfileImageEvent(imagePath: tImageFile1));
      await Future.delayed(Duration.zero);
      cubit.doIntent(ChangeProfileImageEvent(imagePath: tImageFile2));
      await Future.delayed(Duration.zero);

      // Assert
      expect(states.length, 2);
      expect(
        states[0].changeProfileImageState?.imagePath.path,
        tImageFile1.path,
      );
      expect(
        states[1].changeProfileImageState?.imagePath.path,
        tImageFile2.path,
      );

      // Cleanup
      await subscription.cancel();
    });
  });

  group('ProfileDataChangedEvent', () {
    test(
      'should emit state with isChanged true when data is changed',
      () async {
        // Assert later
        expectLater(
          cubit.stream,
          emits(
            predicate<ProfileStates>(
              (state) => state.profileDataChangeState?.isChanged == true,
            ),
          ),
        );

        // Act
        cubit.doIntent(ProfileDataChangedEvent(isChanged: true));
      },
    );

    test(
      'should emit state with isChanged false when data is not changed',
      () async {
        // First set it to true
        cubit.doIntent(ProfileDataChangedEvent(isChanged: true));
        await Future.delayed(Duration.zero);

        // Assert later
        expectLater(
          cubit.stream,
          emits(
            predicate<ProfileStates>(
              (state) => state.profileDataChangeState?.isChanged == false,
            ),
          ),
        );

        // Act
        cubit.doIntent(ProfileDataChangedEvent(isChanged: false));
      },
    );

    test('should toggle isChanged state multiple times', () async {
      // Collect emitted states
      final states = <ProfileStates>[];
      final subscription = cubit.stream.listen(states.add);

      // Act
      cubit.doIntent(ProfileDataChangedEvent(isChanged: true));
      await Future.delayed(Duration.zero);
      cubit.doIntent(ProfileDataChangedEvent(isChanged: false));
      await Future.delayed(Duration.zero);
      cubit.doIntent(ProfileDataChangedEvent(isChanged: true));
      await Future.delayed(Duration.zero);

      // Assert
      expect(states.length, 3);
      expect(states[0].profileDataChangeState?.isChanged, true);
      expect(states[1].profileDataChangeState?.isChanged, false);
      expect(states[2].profileDataChangeState?.isChanged, true);

      // Cleanup
      await subscription.cancel();
    });
  });

  group('State management', () {
    test('should maintain separate states for different operations', () async {
      // Arrange
      final tImageFile = File('path/to/image.jpg');
      final tUserEntity = UserEntity(
        userName: 'john_doe',
        firstName: 'John',
        lastName: 'Doe',
        email: 'john@example.com',
        phone: '01234567890',
      );
      final tResult = Success<UserEntity>(data: tUserEntity);
      when(mockGetProfileDataUseCase()).thenAnswer((_) async => tResult);

      // Act - trigger multiple events
      cubit.doIntent(ChangeProfileImageEvent(imagePath: tImageFile));
      await Future.delayed(Duration.zero);
      cubit.doIntent(ProfileDataChangedEvent(isChanged: true));
      await Future.delayed(Duration.zero);
      cubit.doIntent(GetProfileDataEvent());
      await untilCalled(mockGetProfileDataUseCase());

      // Assert
      expect(
        cubit.state.changeProfileImageState?.imagePath.path,
        tImageFile.path,
      );
      expect(cubit.state.getProfileDataState?.state, StateType.success);
      expect(cubit.state.getProfileDataState?.data, tUserEntity);
      expect(
        cubit.state.profileDataChangeState?.isChanged,
        false,
      ); // Reset after get
      verify(mockGetProfileDataUseCase()).called(1);
    });
  });
}
