// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationParams _$PaginationParamsFromJson(Map<String, dynamic> json) =>
    PaginationParams(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationParamsToJson(PaginationParams instance) =>
    <String, dynamic>{'page': instance.page, 'limit': instance.limit};

FilterParams _$FilterParamsFromJson(Map<String, dynamic> json) =>
    FilterParams(searchQuery: json['search'] as String?);

Map<String, dynamic> _$FilterParamsToJson(FilterParams instance) =>
    <String, dynamic>{'search': instance.searchQuery};
