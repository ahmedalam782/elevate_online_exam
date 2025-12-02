// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';

class ExamEntity {
  final String id;
  final String title;
  final String subject;
  List<QuestionEntity> questions;

  final int? duration;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  ExamEntity({
    required this.id,
    required this.title,
    required this.subject,
    required this.questions,
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
    List<QuestionEntity>? questions,
  }) {
    return ExamEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      duration: duration ?? this.duration,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      questions: questions ?? this.questions,
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
        other.questions == questions &&
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
        questions.hashCode ^
        createdAt.hashCode;
  }

  ExamDto toDto() {
    return ExamDto(
      id: id,
      title: title,
      active: active,
      createdAt: createdAt,
      duration: duration,
      numberOfQuestions: numberOfQuestions,
      questions: questions.map((q) => q.toDto()).toList(),
      subject: subject,
    );
  }
}
