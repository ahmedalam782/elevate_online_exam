import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable()
class Metadata extends Equatable {
  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'numberOfPages')
  final int? numberOfPages;
  @JsonKey(name: 'limit')
  final int? limit;

  const Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);

  Metadata copyWith({int? currentPage, int? numberOfPages, int? limit}) {
    return Metadata(
      currentPage: currentPage ?? this.currentPage,
      numberOfPages: numberOfPages ?? this.numberOfPages,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [currentPage, numberOfPages, limit];
}
