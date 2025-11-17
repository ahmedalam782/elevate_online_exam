import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/use_cases/get_exams_on_subject_use_case.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_cubit.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_events.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view_model/cubit/exams_tap_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exams_tap_cubit_test.mocks.dart';

@GenerateMocks([GetExamsOnSubjectUseCase])
void main() {
  late ExamsTapCubit examsTapCubit;
  late GetExamsOnSubjectUseCase getExamsOnSubjectUseCase;
  final subjectId = "1";
  final page = 1;

  setUpAll(() {
    getExamsOnSubjectUseCase = MockGetExamsOnSubjectUseCase();
    examsTapCubit = ExamsTapCubit(getExamsOnSubjectUseCase);
  });

  tearDown(() {
    examsTapCubit.close();
  });
  group("ExamsTapCubit tests", () {
    test("initial state should be ExamsTapState.initial", () {
      expect(examsTapCubit.state, equals(ExamsTapStates()));
    });

    test(
      "emit loading and success state when getExamsOnSubject is succeed",
      () async {
        PaginatedExams paginatedExams = PaginatedExams(
          exams: [ExamEntity(id: "1", title: "test", subject: "1")],
          currentPage: 1,
          totalPages: 1,
        );
        provideDummy<Result<PaginatedExams>>(
          Success<PaginatedExams>(data: paginatedExams),
        );
        when(
          getExamsOnSubjectUseCase.call(subjectId: subjectId, page: page),
        ).thenAnswer(
          (_) async => Success<PaginatedExams>(data: paginatedExams),
        );

        final examsTapStateStream = examsTapCubit.stream
            .map((state) => state.examsTapState)
            .take(2)
            .toList();

        examsTapCubit.doIntent(
          ExamsTapEvents.getExamsOnSubjectEvent(
            subjectId: subjectId,
            page: page,
          ),
        );

        final emittedStates = await examsTapStateStream;
        expect(emittedStates[0].state, equals(StateType.loading));
        expect(emittedStates[1].state, equals(StateType.success));
        expect(emittedStates[1].data?.exams.length, 1);
        expect(emittedStates[1].data?.exams[0].id, "1");
        expect(emittedStates[1].data?.exams[0].subject, subjectId);
      },
    );

    test(
      "emit loading and error state when getExamsOnSubject is failed",
      () async {
        final errorMessage = "error";
        provideDummy<Result<PaginatedExams>>(
          Error<PaginatedExams>(exception: Exception(errorMessage)),
        );
        when(getExamsOnSubjectUseCase.call(subjectId: "1", page: 1)).thenAnswer(
          (_) async =>
              Error<PaginatedExams>(exception: Exception(errorMessage)),
        );

        final examsTapStateStream = examsTapCubit.stream
            .map((state) => state.examsTapState)
            .take(2)
            .toList();

        examsTapCubit.doIntent(
          ExamsTapEvents.getExamsOnSubjectEvent(
            subjectId: subjectId,
            page: page,
          ),
        );

        final emittedStates = await examsTapStateStream;
        expect(emittedStates[0].state, equals(StateType.loading));
        expect(emittedStates[1].state, equals(StateType.error));
        expect(emittedStates[1].data, isA<Null>());
        expect(
          (emittedStates[1].exception).toString(),
          contains(errorMessage),
        );
      },
    );
  });
}
