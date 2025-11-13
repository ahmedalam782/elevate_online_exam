import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_dto.g.dart';

@JsonSerializable()
class ExamDto {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "numberOfQuestions")
  int? numberOfQuestions;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  ExamDto({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);
}

extension ExamDtoExtension on ExamDto {
  ExamEntity toEntity() => ExamEntity(
    id: id ?? "",
    title: title ?? "",
    duration: duration,
    subject: subject ?? "",
    numberOfQuestions: numberOfQuestions,
    active: active,
    createdAt: createdAt,
  );
}
