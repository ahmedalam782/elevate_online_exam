import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../answer_dto/answer_dto.dart';
import '../exam/exam.dart';

part 'question_dto.g.dart';

const _listEquality = DeepCollectionEquality();

@HiveType(typeId: 2)
@JsonSerializable()
class QuestionDto extends HiveObject {
  @HiveField(1)
  @JsonKey(name: "answers")
  List<AnswerDto>? answers;

  @HiveField(3)
  @JsonKey(name: "type")
  String? type;

  @HiveField(5)
  @JsonKey(name: "_id")
  String? id;

  @HiveField(7)
  @JsonKey(name: "question")
  String? question;

  @HiveField(9)
  @JsonKey(name: "correct")
  String? correct;

  @HiveField(11)
  @JsonKey(name: "subject")
  dynamic subject;

  @HiveField(13)
  @JsonKey(name: "exam")
  Exam? exam;

  @HiveField(15)
  @JsonKey(name: "createdAt")
  String? createdAt;
  @HiveField(17)
  String? answeredQuestion;

  QuestionDto({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
    this.answeredQuestion,
  });

  QuestionDto copyWith({
    List<AnswerDto>? answers,
    String? type,
    String? id,
    String? question,
    String? correct,
    dynamic subject,
    Exam? exam,
    String? createdAt,
  }) => QuestionDto(
    answers: answers ?? this.answers,
    type: type ?? this.type,
    id: id ?? this.id,
    question: question ?? this.question,
    correct: correct ?? this.correct,
    subject: subject ?? this.subject,
    exam: exam ?? this.exam,
    createdAt: createdAt ?? this.createdAt,
  );

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionDto &&
          runtimeType == other.runtimeType &&
          _listEquality.equals(answers, other.answers) &&
          type == other.type &&
          id == other.id &&
          question == other.question &&
          correct == other.correct &&
          subject == other.subject &&
          exam == other.exam &&
          createdAt == other.createdAt;

  @override
  int get hashCode => Object.hash(
    _listEquality.hash(answers),
    type,
    id,
    question,
    correct,
    subject,
    exam,
    createdAt,
  );
}
