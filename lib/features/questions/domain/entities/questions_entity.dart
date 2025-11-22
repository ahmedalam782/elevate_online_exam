// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
import 'package:flutter/foundation.dart';

import 'package:elevate_online_exam/features/questions/domain/entities/answer_entity.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/exam_entity.dart';

class QuestionEntity {
  final String questionTitle;
  final String id;
  final String correctAnswer;
  final String type;
  String? answeredQuestion;
  final List<AnswerEntity> answers;
  final ExamEntity exam;
  QuestionEntity({
    required this.questionTitle,
    required this.id,
    required this.correctAnswer,
    required this.type,
    this.answeredQuestion,
    required this.answers,
    required this.exam,
  });

  QuestionEntity copyWith({
    String? questionTitle,
    String? id,
    String? correctAnswer,
    String? type,
    String? answeredQuestion,
    List<AnswerEntity>? answers,
    ExamEntity? exam,
  }) {
    return QuestionEntity(
      questionTitle: questionTitle ?? this.questionTitle,
      id: id ?? this.id,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      type: type ?? this.type,
      answeredQuestion: answeredQuestion ?? this.answeredQuestion,
      answers: answers ?? this.answers,
      exam: exam ?? this.exam,
    );
  }

  @override
  bool operator ==(covariant QuestionEntity other) {
    if (identical(this, other)) return true;

    return other.questionTitle == questionTitle &&
        other.id == id &&
        other.correctAnswer == correctAnswer &&
        other.type == type &&
        other.answeredQuestion == answeredQuestion &&
        listEquals(other.answers, answers) &&
        other.exam == exam;
  }

  @override
  int get hashCode {
    return questionTitle.hashCode ^
        id.hashCode ^
        correctAnswer.hashCode ^
        type.hashCode ^
        answeredQuestion.hashCode ^
        answers.hashCode ^
        exam.hashCode;
  }

  QuestionDto toDto() {
    return QuestionDto(
      answeredQuestion: answeredQuestion,
      correct: correctAnswer,
      answers: answers.map((a) => a.toDto()).toList(),
      exam: exam.toDto(),
      id: id,
      question: questionTitle,
      type: type,
    );
  }
}
