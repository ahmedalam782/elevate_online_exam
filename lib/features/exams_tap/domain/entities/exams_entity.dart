// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExamEntity {
  final String id;
  final String title;
  final String subject;

  final int? duration;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  ExamEntity({
    required this.id,
    required this.title,
    required this.subject,
    this.duration,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  ExamEntity copyWith({
    String? id,
    String? title,
    String? subject,
    int? duration,
    int? numberOfQuestions,
    bool? active,
    DateTime? createdAt,
  }) {
    return ExamEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      duration: duration ?? this.duration,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(covariant ExamEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.subject == subject &&
        other.duration == duration &&
        other.numberOfQuestions == numberOfQuestions &&
        other.active == active &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subject.hashCode ^
        duration.hashCode ^
        numberOfQuestions.hashCode ^
        active.hashCode ^
        createdAt.hashCode;
  }
}
