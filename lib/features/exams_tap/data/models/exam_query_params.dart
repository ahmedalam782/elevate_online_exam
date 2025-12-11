
class ExamQueryParams {
  final String? subjectId;
  final int? page;


  ExamQueryParams({this.subjectId, this.page});

  Map<String, dynamic> toMap() => {
        if (subjectId != null) "subject": subjectId,
        if (page != null) "page": page,
      };
}
