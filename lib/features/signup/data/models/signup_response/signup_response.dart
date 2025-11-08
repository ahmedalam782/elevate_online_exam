import 'package:elevate_online_exam/features/signup/domain/models/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_dto.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  String? token;
  UserDto? userDto;

  SignupResponse({this.message, this.token, this.userDto});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return _$SignupResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);

  UserEntity toUserEntity() {
    return UserEntity(
      id: userDto?.id ?? "",
      username: userDto?.username ?? "",
      firstName: userDto?.firstName ?? "",
      lastName: userDto?.lastName ?? "",
      email: userDto?.email ?? "",
      phone: userDto?.phone ?? "",
      role: userDto?.role ?? "",
      token: token ?? "",
    );
  }
}
