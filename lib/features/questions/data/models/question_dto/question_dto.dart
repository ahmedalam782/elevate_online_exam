import 'package:collection/collection.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/exam_entity.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../answer_dto/answer_dto.dart';
import '../exam/exam.dart';

part 'question_dto.g.dart';

const _listEquality = DeepCollectionEquality();

@JsonSerializable()
class QuestionDto extends HiveObject {
  @JsonKey(name: "answers")
  List<AnswerDto>? answers;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "question")
  String? question;

  @JsonKey(name: "correct")
  String? correct;

  @JsonKey(name: "subject")
  dynamic subject;

  @JsonKey(name: "exam")
  ExamDto? exam;

  @JsonKey(name: "createdAt")
  String? createdAt;
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
    ExamDto? exam,
    String? createdAt,
    String? answeredQuestion,
  }) => QuestionDto(
    answers: answers ?? this.answers,
    type: type ?? this.type,
    id: id ?? this.id,
    question: question ?? this.question,
    correct: correct ?? this.correct,
    subject: subject ?? this.subject,
    exam: exam ?? this.exam,
    createdAt: createdAt ?? this.createdAt,
    answeredQuestion: answeredQuestion ?? this.answeredQuestion,
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
          createdAt == other.createdAt &&
          answeredQuestion == other.answeredQuestion;

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
    createdAt,
    answeredQuestion,
  );

  QuestionEntity toEntity() {
    return QuestionEntity(
      exam:
          exam?.toEntity() ??
          ExamEntity(
            title: "",
            duration: 0,
            id: "",
            subject: "",
            questions: [],
          ),
      questionTitle: question ?? "",
      id: id ?? "",
      correctAnswer: correct ?? "",
      type: type ?? "",
      answers:
          answers?.map((answer) {
            return answer.toEntity();
          }).toList() ??
          [],
      answeredQuestion: null,
    );
  }
}
