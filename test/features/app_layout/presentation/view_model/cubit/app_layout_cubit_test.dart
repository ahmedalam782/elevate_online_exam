import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/app_layout/domain/use_cases/logout_use_case.dart';
import 'package:elevate_online_exam/features/app_layout/presentation/view_model/cubit/app_layout_cubit.dart';
import 'package:elevate_online_exam/features/app_layout/presentation/view_model/cubit/app_layout_events.dart';
import 'package:elevate_online_exam/features/app_layout/presentation/view_model/cubit/app_layout_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_layout_cubit_test.mocks.dart';

// Generate mocks for the following classes
@GenerateMocks([LogoutUseCase])
void main() {
  late AppLayoutCubit cubit;
  late MockLogoutUseCase mockLogoutUseCase;

  setUp(() {
    mockLogoutUseCase = MockLogoutUseCase();
    cubit = AppLayoutCubit(mockLogoutUseCase);

    // Provide dummy values for Result types
    provideDummy<Result<void>>(const Success(data: null));
  });

  tearDown(() {
    cubit.close();
  });

  group('ChangeIndexEvent', () {
    test('initial state should have index 0', () {
      expect(cubit.state.changeIndexState?.currentIndex, 0);
    });

    test(
      'should emit state with new index when ChangeIndexEvent is triggered',
      () async {
        // Arrange
        const newIndex = 2;
        final expectedStates = [
          const AppLayoutStates(
            changeIndexState: ChangeIndexState(currentIndex: 0),
          ), // initial state
          const AppLayoutStates(
            changeIndexState: ChangeIndexState(currentIndex: newIndex),
          ),
        ];

        // Assert later
        expectLater(
          cubit.stream,
          emitsInOrder(expectedStates.skip(1)), // skip initial state
        );

        // Act
        cubit.doIndented(ChangeIndexEvent(newIndex));
      },
    );

    test(
      'should emit state with index 1 when switching to profile tab',
      () async {
        // Arrange
        const newIndex = 1;

        // Assert later
        expectLater(
          cubit.stream,
          emits(
            const AppLayoutStates(
              changeIndexState: ChangeIndexState(currentIndex: newIndex),
            ),
          ),
        );

        // Act
        cubit.doIndented(ChangeIndexEvent(newIndex));
      },
    );

    test(
      'should update state multiple times when index changes multiple times',
      () async {
        // Arrange
        final expectedStates = [
          const AppLayoutStates(
            changeIndexState: ChangeIndexState(currentIndex: 1),
          ),
          const AppLayoutStates(
            changeIndexState: ChangeIndexState(currentIndex: 2),
          ),
          const AppLayoutStates(
            changeIndexState: ChangeIndexState(currentIndex: 0),
          ),
        ];

        // Assert later
        expectLater(cubit.stream, emitsInOrder(expectedStates));

        // Act
        cubit.doIndented(ChangeIndexEvent(1));
        cubit.doIndented(ChangeIndexEvent(2));
        cubit.doIndented(ChangeIndexEvent(0));
      },
    );
  });

  group('LogoutEvent', () {
    test(
      'should emit loading state then success state when logout succeeds',
      () async {
        // Arrange
        const tResult = Success<void>(data: null);
        when(mockLogoutUseCase()).thenAnswer((_) async => tResult);

        final expectedStates = [
          const AppLayoutStates(
            logoutState: LogoutState(state: StateType.loading),
          ),
          const AppLayoutStates(
            logoutState: LogoutState(state: StateType.success),
          ),
        ];

        // Assert later
        expectLater(cubit.stream, emitsInOrder(expectedStates));

        // Act
        cubit.doIndented(LogoutEvent());

        // Wait for async operation
        await untilCalled(mockLogoutUseCase());
        verify(mockLogoutUseCase()).called(1);
      },
    );

    test(
      'should emit loading state then error state when logout fails',
      () async {
        // Arrange
        final tException = Exception('Logout failed');
        final tResult = Error<void>(exception: tException);
        when(mockLogoutUseCase()).thenAnswer((_) async => tResult);

        // Collect emitted states
        final states = <AppLayoutStates>[];
        final subscription = cubit.stream.listen(states.add);

        // Act
        cubit.doIndented(LogoutEvent());

        // Wait for async operation to complete
        await untilCalled(mockLogoutUseCase());
        await Future.delayed(Duration.zero);

        // Assert
        expect(states.length, 2);
        expect(states[0].logoutState?.state, StateType.loading);
        expect(states[1].logoutState?.state, StateType.error);
        expect(states[1].logoutState?.exception, tException);
        verify(mockLogoutUseCase()).called(1);

        // Cleanup
        await subscription.cancel();
      },
    );

    test('should not affect currentIndex when logout is triggered', () async {
      // Arrange
      const tResult = Success<void>(data: null);
      when(mockLogoutUseCase()).thenAnswer((_) async => tResult);

      // First change index
      cubit.doIndented(ChangeIndexEvent(1));
      await Future.delayed(Duration.zero); // Wait for state emission

      final indexBeforeLogout = cubit.state.changeIndexState?.currentIndex;

      // Act
      cubit.doIndented(LogoutEvent());
      await untilCalled(mockLogoutUseCase());

      // Assert
      expect(cubit.state.changeIndexState?.currentIndex, indexBeforeLogout);
      verify(mockLogoutUseCase()).called(1);
    });

    test('should handle multiple logout attempts correctly', () async {
      // Arrange
      const tResult = Success<void>(data: null);
      when(mockLogoutUseCase()).thenAnswer((_) async => tResult);

      // Collect emitted states
      final states = <AppLayoutStates>[];
      final subscription = cubit.stream.listen(states.add);

      // Act - trigger logout twice
      cubit.doIndented(LogoutEvent());
      await untilCalled(mockLogoutUseCase());
      await Future.delayed(Duration.zero);

      cubit.doIndented(LogoutEvent());
      await Future.delayed(Duration.zero);

      // Assert
      expect(
        states.where((s) => s.logoutState?.state == StateType.loading).length,
        2,
      );
      expect(
        states.where((s) => s.logoutState?.state == StateType.success).length,
        2,
      );
      verify(mockLogoutUseCase()).called(2);

      // Cleanup
      await subscription.cancel();
    });

    test(
      'should emit error state with specific exception when network fails',
      () async {
        // Arrange
        final tException = Exception('Network connection lost');
        final tResult = Error<void>(exception: tException);
        when(mockLogoutUseCase()).thenAnswer((_) async => tResult);

        // Collect emitted states
        final states = <AppLayoutStates>[];
        final subscription = cubit.stream.listen(states.add);

        // Act
        cubit.doIndented(LogoutEvent());
        await untilCalled(mockLogoutUseCase());
        await Future.delayed(Duration.zero);

        // Assert
        final errorState = states.firstWhere(
          (s) => s.logoutState?.state == StateType.error,
        );
        expect(
          errorState.logoutState?.exception?.toString(),
          contains('Network connection lost'),
        );
        verify(mockLogoutUseCase()).called(1);

        // Cleanup
        await subscription.cancel();
      },
    );
  });

  group('State management', () {
    test('should maintain separate states for index and logout', () async {
      // Arrange
      const tResult = Success<void>(data: null);
      when(mockLogoutUseCase()).thenAnswer((_) async => tResult);

      // Change index first
      cubit.doIndented(ChangeIndexEvent(2));
      await Future.delayed(Duration.zero);

      // Act - trigger logout
      cubit.doIndented(LogoutEvent());
      await untilCalled(mockLogoutUseCase());

      // Assert
      expect(cubit.state.changeIndexState?.currentIndex, 2);
      expect(cubit.state.logoutState?.state, StateType.success);
      verify(mockLogoutUseCase()).called(1);
    });

    test('should handle rapid index changes correctly', () async {
      // Collect emitted states
      final states = <AppLayoutStates>[];
      final subscription = cubit.stream.listen(states.add);

      // Act - rapid index changes
      for (int i = 0; i < 5; i++) {
        cubit.doIndented(ChangeIndexEvent(i % 3));
        await Future.delayed(Duration.zero);
      }

      // Assert - should have received all state changes
      expect(states.length, 5);
      expect(states.last.changeIndexState?.currentIndex, 4 % 3);

      // Cleanup
      await subscription.cancel();
    });
  });
}
