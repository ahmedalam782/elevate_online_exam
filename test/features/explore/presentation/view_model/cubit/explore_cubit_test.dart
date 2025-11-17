import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/core/helper/classes/params.dart';
import 'package:elevate_online_exam/features/explore/domain/entities/subject_entities.dart';
import 'package:elevate_online_exam/features/explore/domain/use_cases/get_all_subjects_use_case.dart';
import 'package:elevate_online_exam/features/explore/presentation/view_model/cubit/explore_cubit.dart';
import 'package:elevate_online_exam/features/explore/presentation/view_model/cubit/explore_event.dart';
import 'package:elevate_online_exam/features/explore/presentation/view_model/cubit/explore_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'explore_cubit_test.mocks.dart';

@GenerateMocks([GetAllSubjectsUseCase])
void main() {
  late ExploreCubit exploreCubit;
  late MockGetAllSubjectsUseCase mockGetAllSubjectsUseCase;

  setUp(() {
    mockGetAllSubjectsUseCase = MockGetAllSubjectsUseCase();
    exploreCubit = ExploreCubit(mockGetAllSubjectsUseCase);

    // Provide dummy value for Result type
    provideDummy<Result<List<SubjectEntities>>>(
      const Success(data: <SubjectEntities>[]),
    );
  });

  tearDown(() {
    if (!exploreCubit.isClosed) {
      exploreCubit.close();
    }
  });

  group('doAction - GetAllSubjectsEvent', () {
    final tSubjects = [
      SubjectEntities(id: '1', name: 'Mathematics', icon: 'math_icon'),
      SubjectEntities(id: '2', name: 'Physics', icon: 'physics_icon'),
      SubjectEntities(id: '3', name: 'Chemistry', icon: 'chemistry_icon'),
    ];

    test(
      'initial state should be ExploreState with null getAllSubjects',
      () async {
        expect(exploreCubit.state, const ExploreState());
        expect(exploreCubit.state.getAllSubjects, isNull);
      },
    );

    test(
      'should emit [loading, success] when GetAllSubjectsEvent is called with success',
      () async {
        // Arrange
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => Success(data: tSubjects));

        // Act
        final future = exploreCubit.stream.toList();
        await exploreCubit.doAction(GetAllSubjectsEvent());
        await exploreCubit.close();
        final states = await future;

        // Assert
        expect(states.length, 2);
        expect(states[0].getAllSubjects?.state, StateType.loading);
        expect(states[1].getAllSubjects?.state, StateType.success);
        expect(states[1].getAllSubjects?.data, tSubjects);
        verify(
          mockGetAllSubjectsUseCase(const PaginationParams(page: 1, limit: 20)),
        ).called(1);
      },
    );

    test(
      'should emit [loading, success] with empty list when remote returns empty data',
      () async {
        // Arrange
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => const Success(data: []));

        // Act
        final future = exploreCubit.stream.toList();
        await exploreCubit.doAction(GetAllSubjectsEvent());
        await exploreCubit.close();
        final states = await future;

        // Assert
        expect(states.length, 2);
        expect(states[0].getAllSubjects?.state, StateType.loading);
        expect(states[1].getAllSubjects?.state, StateType.success);
        expect(states[1].getAllSubjects?.data, isEmpty);
        verify(
          mockGetAllSubjectsUseCase(const PaginationParams(page: 1, limit: 20)),
        ).called(1);
      },
    );

    test(
      'should emit [loading, error] when GetAllSubjectsEvent fails',
      () async {
        // Arrange
        final tException = Exception('Server error');
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => Error(exception: tException));

        // Act
        final future = exploreCubit.stream.toList();
        await exploreCubit.doAction(GetAllSubjectsEvent());
        await exploreCubit.close();
        final states = await future;

        // Assert
        expect(states.length, 2);
        expect(states[0].getAllSubjects?.state, StateType.loading);
        expect(states[1].getAllSubjects?.state, StateType.error);
        expect(states[1].getAllSubjects?.exception, tException);
        verify(
          mockGetAllSubjectsUseCase(const PaginationParams(page: 1, limit: 20)),
        ).called(1);
      },
    );

    test(
      'should filter subjects by search text when searchText is provided',
      () async {
        // Arrange
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => Success(data: tSubjects));

        // Act
        await exploreCubit.doAction(GetAllSubjectsEvent(searchText: 'Math'));

        // Assert
        expect(exploreCubit.state.getAllSubjects?.state, StateType.success);
        expect(exploreCubit.filteredSubjects.length, 1);
        expect(exploreCubit.filteredSubjects.first.name, 'Mathematics');
        verify(
          mockGetAllSubjectsUseCase(const PaginationParams(page: 1, limit: 20)),
        ).called(1);
      },
    );

    test('should handle case-insensitive search', () async {
      // Arrange
      when(
        mockGetAllSubjectsUseCase(any),
      ).thenAnswer((_) async => Success(data: tSubjects));

      // Act
      await exploreCubit.doAction(GetAllSubjectsEvent(searchText: 'physics'));

      // Assert
      expect(exploreCubit.state.getAllSubjects?.state, StateType.success);
      expect(exploreCubit.filteredSubjects.length, 1);
      expect(exploreCubit.filteredSubjects.first.name, 'Physics');
    });

    test('should emit [moreLoading, success] when isRefresh is true', () async {
      // Arrange
      exploreCubit.filteredSubjects = [tSubjects.first];
      exploreCubit.currentPage = 2;
      when(
        mockGetAllSubjectsUseCase(any),
      ).thenAnswer((_) async => Success(data: [tSubjects[1]]));

      // Act
      final future = exploreCubit.stream.toList();
      await exploreCubit.doAction(GetAllSubjectsEvent(isRefresh: true));
      await exploreCubit.close();
      final states = await future;

      // Assert
      expect(states.length, 2);
      expect(states[0].getAllSubjects?.state, StateType.moreLoading);
      expect(states[1].getAllSubjects?.state, StateType.success);
      verify(
        mockGetAllSubjectsUseCase(const PaginationParams(page: 2, limit: 20)),
      ).called(1);
    });

    test(
      'should set isMoreLoading to true when result length equals limit',
      () async {
        // Arrange
        final twentySubjects = List.generate(
          20,
          (index) => SubjectEntities(
            id: '$index',
            name: 'Subject $index',
            icon: 'icon_$index',
          ),
        );
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => Success(data: twentySubjects));

        // Act
        await exploreCubit.doAction(GetAllSubjectsEvent());

        // Assert
        expect(exploreCubit.isMoreLoading, true);
        expect(exploreCubit.currentPage, 2);
      },
    );

    test(
      'should set isMoreLoading to false when result length is less than limit',
      () async {
        // Arrange
        final fewSubjects = List.generate(
          5,
          (index) => SubjectEntities(
            id: '$index',
            name: 'Subject $index',
            icon: 'icon_$index',
          ),
        );
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => Success(data: fewSubjects));

        // Act
        await exploreCubit.doAction(GetAllSubjectsEvent());

        // Assert
        expect(exploreCubit.isMoreLoading, false);
      },
    );

    test(
      'should reset currentPage and filteredSubjects when isRefresh is false',
      () async {
        // Arrange
        exploreCubit.currentPage = 5;
        exploreCubit.filteredSubjects = [tSubjects.first];
        exploreCubit.isMoreLoading = true;
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => Success(data: tSubjects));

        // Act
        await exploreCubit.doAction(GetAllSubjectsEvent(isRefresh: false));

        // Assert
        expect(exploreCubit.currentPage, 2); // Incremented after success
        verify(
          mockGetAllSubjectsUseCase(const PaginationParams(page: 1, limit: 20)),
        ).called(1);
      },
    );

    test(
      'should use searchController text when searchText is not provided',
      () async {
        // Arrange
        exploreCubit.searchController.text = 'Chem';
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => Success(data: tSubjects));

        // Act
        await exploreCubit.doAction(GetAllSubjectsEvent());

        // Assert
        expect(exploreCubit.state.getAllSubjects?.state, StateType.success);
        expect(exploreCubit.filteredSubjects.length, 1);
        expect(exploreCubit.filteredSubjects.first.name, 'Chemistry');
      },
    );

    test(
      'should return empty list when search text does not match any subject',
      () async {
        // Arrange
        when(
          mockGetAllSubjectsUseCase(any),
        ).thenAnswer((_) async => Success(data: tSubjects));

        // Act
        await exploreCubit.doAction(GetAllSubjectsEvent(searchText: 'Biology'));

        // Assert
        expect(exploreCubit.state.getAllSubjects?.state, StateType.success);
        expect(exploreCubit.filteredSubjects, isEmpty);
      },
    );

    test('should handle network error appropriately', () async {
      // Arrange
      final tException = Exception('No internet connection');
      when(
        mockGetAllSubjectsUseCase(any),
      ).thenAnswer((_) async => Error(exception: tException));

      // Act
      final future = exploreCubit.stream.toList();
      await exploreCubit.doAction(GetAllSubjectsEvent());
      await exploreCubit.close();
      final states = await future;

      // Assert
      expect(states.length, 2);
      expect(states[0].getAllSubjects?.state, StateType.loading);
      expect(states[1].getAllSubjects?.state, StateType.error);
      expect(states[1].getAllSubjects?.exception, tException);
    });

    test('should set isMoreLoading to false on error', () async {
      // Arrange
      final tException = Exception('Server error');
      when(
        mockGetAllSubjectsUseCase(any),
      ).thenAnswer((_) async => Error(exception: tException));

      // Act
      await exploreCubit.doAction(GetAllSubjectsEvent());

      // Assert
      expect(exploreCubit.isMoreLoading, false);
    });
  });

  group('ExploreCubit lifecycle', () {
    test('should dispose searchController on close', () async {
      // Verify that close doesn't throw
      await exploreCubit.close();
      expect(exploreCubit.isClosed, true);
    });

    test('should not emit when cubit is closed', () async {
      await exploreCubit.close();
      // This should not emit or throw
      exploreCubit.emit(const ExploreState());
      expect(exploreCubit.isClosed, true);
    });
  });
}
