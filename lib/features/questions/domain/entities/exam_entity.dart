// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExamEntity {
  final String title;
  final int duration;

  ExamEntity({required this.title, required this.duration});

  ExamEntity copyWith({String? title, int? duration}) {
    return ExamEntity(
      title: title ?? this.title,
      duration: duration ?? this.duration,
    );
  }

  @override
  bool operator ==(covariant ExamEntity other) {
    if (identical(this, other)) return true;

    return other.title == title && other.duration == duration;
  }

  @override
  int get hashCode => title.hashCode ^ duration.hashCode;
}
