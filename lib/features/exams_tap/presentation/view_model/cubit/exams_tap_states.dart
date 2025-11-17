import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';
import 'package:equatable/equatable.dart';

class ExamsTapStates extends Equatable {
  const ExamsTapStates({ this.examsTapState = const BaseState.initial()});
  final BaseState<PaginatedExams> examsTapState;

  ExamsTapStates copyWith({BaseState<PaginatedExams>? examsTapState}) {
    return ExamsTapStates(examsTapState: examsTapState ?? this.examsTapState);
  }
  
  @override
  List<Object?> get props => [examsTapState];
}
