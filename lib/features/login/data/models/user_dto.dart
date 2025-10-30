import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';
@JsonSerializable()
class UserDto {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "username")
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? createdAt;

  UserDto({
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
