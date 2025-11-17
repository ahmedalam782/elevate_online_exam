import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/paginated_exams.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exams_response_dto.g.dart';

@JsonSerializable()
class ExamsResponseDto {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "exams")
  List<ExamDto>? exams;

  ExamsResponseDto({
    required this.message,
    required this.metadata,
    required this.exams,
  });

  factory ExamsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseDtoFromJson(json);
}

extension ExamsResponseDtoExtension on ExamsResponseDto {
  PaginatedExams toPaginatedExams() => PaginatedExams(
    exams: exams?.map((e) => e.toEntity()).toList() ?? [],
    currentPage: metadata?.currentPage ?? 1,
    totalPages: metadata?.numberOfPages ?? 1,
  );
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  int? currentPage;
  @JsonKey(name: "numberOfPages")
  int? numberOfPages;
  @JsonKey(name: "limit")
  int? limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}
