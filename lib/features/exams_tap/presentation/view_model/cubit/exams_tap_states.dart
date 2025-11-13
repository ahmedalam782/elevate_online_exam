
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';

class ExamsTapStates {
  ExamsTapStates({ this.examsTapState = const BaseState.initial()});
  BaseState<PaginatedExams> examsTapState;

  ExamsTapStates copyWith({BaseState<PaginatedExams>? examsTapState}) {
    return ExamsTapStates(examsTapState: examsTapState ?? this.examsTapState);
  }
}
