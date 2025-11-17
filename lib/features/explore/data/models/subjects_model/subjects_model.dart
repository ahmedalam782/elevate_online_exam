import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import 'subject.dart';
part 'subjects_model.g.dart';

@JsonSerializable()
class SubjectsModel extends Equatable {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'metadata')
  final Metadata? metadata;
  @JsonKey(name: 'subjects')
  final List<Subject>? subjects;

  const SubjectsModel({this.message, this.metadata, this.subjects});

  factory SubjectsModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsModelToJson(this);

  SubjectsModel copyWith({
    String? message,
    Metadata? metadata,
    List<Subject>? subjects,
  }) {
    return SubjectsModel(
      message: message ?? this.message,
      metadata: metadata ?? this.metadata,
      subjects: subjects ?? this.subjects,
    );
  }

  @override
  List<Object?> get props => [message, metadata, subjects];
}
