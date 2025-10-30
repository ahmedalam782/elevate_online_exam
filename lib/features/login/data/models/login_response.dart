import 'package:elevate_online_exam/features/login/data/models/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
   String? message;
   String? token;
   UserDto? user;
   int? code;
  LoginResponse({this.message, this.token, this.code});
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
