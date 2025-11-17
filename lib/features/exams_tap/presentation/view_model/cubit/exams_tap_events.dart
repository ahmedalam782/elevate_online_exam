sealed class ExamsTapEvents {
  const ExamsTapEvents();

  factory ExamsTapEvents.getExamsOnSubjectEvent({
    required String subjectId,
    int? page,
  }) = GetExamsOnSubjectEvent;

  factory ExamsTapEvents.loadExamsNextPageEvent({
    required String subjectId,
  }) = LoadExamsNextPageEvent;
  void when({
    required void Function(GetExamsOnSubjectEvent) getExamsOnSubjectEvent,
    required void Function(LoadExamsNextPageEvent) loadExamsNextPageEvent,
  }) {
    switch (this) {
    case GetExamsOnSubjectEvent e:
      getExamsOnSubjectEvent(e);
    case LoadExamsNextPageEvent e:
      loadExamsNextPageEvent(e);
  }
  }
}

class GetExamsOnSubjectEvent extends ExamsTapEvents {
  final String subjectId;
  final int? page;
  GetExamsOnSubjectEvent({required this.subjectId, this.page = 1});
}

class LoadExamsNextPageEvent extends ExamsTapEvents {
  final String subjectId;
  LoadExamsNextPageEvent({required this.subjectId});
}
