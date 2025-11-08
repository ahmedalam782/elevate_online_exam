import 'package:json_annotation/json_annotation.dart';

part 'signup_post_dto.g.dart';

@JsonSerializable()
class SignupPostDto {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  SignupPostDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory SignupPostDto.fromJson(Map<String, dynamic> json) {
    return _$SignupPostDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignupPostDtoToJson(this);
}
