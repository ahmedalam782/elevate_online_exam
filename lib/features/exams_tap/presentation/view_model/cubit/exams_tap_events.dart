sealed class ExamsTapEvents {
  const ExamsTapEvents();

   factory ExamsTapEvents.getExamsOnSubjectEvent({
    required String subjectId,
    int? page,
  }) = GetExamsOnSubjectEvent;

  void when({
    required void Function(GetExamsOnSubjectEvent) getExamsOnSubjectEvent,
  }) {
    if (this is GetExamsOnSubjectEvent) {
      getExamsOnSubjectEvent(this as GetExamsOnSubjectEvent);
    }
  }
}

class GetExamsOnSubjectEvent extends ExamsTapEvents {
  final String subjectId;
  final int? page;
  GetExamsOnSubjectEvent({required this.subjectId, this.page = 1});
}

