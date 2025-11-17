// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => QuestionDto(
  answers: (json['answers'] as List<dynamic>?)
      ?.map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  type: json['type'] as String?,
  id: json['_id'] as String?,
  question: json['question'] as String?,
  correct: json['correct'] as String?,
  subject: json['subject'],
  exam: json['exam'] == null
      ? null
      : Exam.fromJson(json['exam'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
  answeredQuestion: json['answeredQuestion'] as String?,
);

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      'answers': instance.answers,
      'type': instance.type,
      '_id': instance.id,
      'question': instance.question,
      'correct': instance.correct,
      'subject': instance.subject,
      'exam': instance.exam,
      'createdAt': instance.createdAt,
      'answeredQuestion': instance.answeredQuestion,
    };
