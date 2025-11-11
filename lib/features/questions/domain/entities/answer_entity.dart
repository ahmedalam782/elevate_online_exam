// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnswerEntity {
  final String title;
  final String key;
  AnswerEntity({required this.title, required this.key});

  AnswerEntity copyWith({String? title, String? key}) {
    return AnswerEntity(title: title ?? this.title, key: key ?? this.key);
  }

  @override
  bool operator ==(covariant AnswerEntity other) {
    if (identical(this, other)) return true;

    return other.title == title && other.key == key;
  }

  @override
  int get hashCode => title.hashCode ^ key.hashCode;
}
