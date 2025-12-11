// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsModel _$SubjectsModelFromJson(Map<String, dynamic> json) =>
    SubjectsModel(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectsModelToJson(SubjectsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };
