import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/subject_entities.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  const Subject({this.id, this.name, this.icon, this.createdAt});

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  Subject copyWith({
    String? id,
    String? name,
    String? icon,
    DateTime? createdAt,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, name, icon, createdAt];
   
  SubjectEntities toEntity() {
    return SubjectEntities(
      name: name ?? '',
      icon: icon ?? '',
      id: id ?? '',
    );
  }
}
