import 'package:elevate_online_exam/features/questions/domain/entities/answer_entity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswerDto extends HiveObject {
  @JsonKey(name: "answer")
  String? answer;

  @JsonKey(name: "key")
  String? key;

  AnswerDto({this.answer, this.key});

  AnswerDto copyWith({String? answer, String? key}) =>
      AnswerDto(answer: answer ?? this.answer, key: key ?? this.key);

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerDtoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerDto &&
          runtimeType == other.runtimeType &&
          answer == other.answer &&
          key == other.key;

  @override
  int get hashCode => Object.hash(answer, key);

  AnswerEntity toEntity() {
    return AnswerEntity(title: answer ?? "", key: key ?? "");
  }
}
