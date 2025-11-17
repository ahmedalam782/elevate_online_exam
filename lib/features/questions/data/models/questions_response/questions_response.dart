import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../question_dto/question_dto.dart';

part 'questions_response.g.dart';

const _listEquality = DeepCollectionEquality();

@HiveType(typeId: 1)
@JsonSerializable()
class QuestionsResponse extends HiveObject {
  @HiveField(1)
  @JsonKey(name: "message")
  String? message;

  @HiveField(3)
  @JsonKey(name: "questions")
  List<QuestionDto>? questions;

  QuestionsResponse({this.message, this.questions});

  QuestionsResponse copyWith({String? message, List<QuestionDto>? questions}) =>
      QuestionsResponse(
        message: message ?? this.message,
        questions: questions ?? this.questions,
      );

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionsResponse &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          _listEquality.equals(questions, other.questions);

  @override
  int get hashCode => Object.hash(message, _listEquality.hash(questions));
}
