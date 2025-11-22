// import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
// import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
// import 'package:elevate_online_exam/features/questions/domain/entities/exam_entity.dart';
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'exam.g.dart';

// @HiveType(typeId: 4)
// @JsonSerializable()
// class ExamDto extends HiveObject {
//   @HiveField(1)
//   @JsonKey(name: "_id")
//   String? id;

//   @HiveField(3)
//   @JsonKey(name: "title")
//   String? title;

//   @HiveField(5)
//   @JsonKey(name: "duration")
//   int? duration;

//   @HiveField(7)
//   @JsonKey(name: "subject")
//   String? subject;

//   @HiveField(9)
//   @JsonKey(name: "numberOfQuestions")
//   int? numberOfQuestions;

//   @HiveField(11)
//   @JsonKey(name: "active")
//   bool? active;

//   @HiveField(13)
//   @JsonKey(name: "createdAt")
//   String? createdAt;
//   @HiveField(15)
//   List<QuestionDto>? questions;

//   ExamDto({
//     this.id,
//     this.title,
//     this.duration,
//     this.subject,
//     this.numberOfQuestions,
//     this.active,
//     this.createdAt,
//     this.questions,
//   });

//   ExamDto copyWith({
//     String? id,
//     String? title,
//     int? duration,
//     String? subject,
//     int? numberOfQuestions,
//     bool? active,
//     String? createdAt,
//     List<QuestionDto>? questions,
//   }) => ExamDto(
//     id: id ?? this.id,
//     title: title ?? this.title,
//     duration: duration ?? this.duration,
//     subject: subject ?? this.subject,
//     numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
//     active: active ?? this.active,
//     createdAt: createdAt ?? this.createdAt,
//     questions: questions ?? this.questions,
//   );

//   factory ExamDto.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

//   Map<String, dynamic> toJson() => _$ExamToJson(this);

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ExamDto &&
//           runtimeType == other.runtimeType &&
//           id == other.id &&
//           title == other.title &&
//           duration == other.duration &&
//           subject == other.subject &&
//           numberOfQuestions == other.numberOfQuestions &&
//           active == other.active &&
//           createdAt == other.createdAt &&
//           questions == other.questions;

//   @override
//   int get hashCode => Object.hash(
//     id,
//     title,
//     duration,
//     subject,
//     numberOfQuestions,
//     active,
//     createdAt,
//     questions,
//   );
//   ExamEntity toEntity() {
//     return ExamEntity(
//       title: title ?? "",
//       duration: duration ?? 0,
//       id: id ?? "",
//       subject: subject ?? "",
//       active: active,
//       numberOfQuestions: numberOfQuestions,
//     );
//   }
// }
