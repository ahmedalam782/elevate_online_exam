import 'package:elevate_online_exam/features/login/data/models/user_dto.dart';
import 'package:elevate_online_exam/features/login/domain/entities/login_response_model.dart';
import 'package:elevate_online_exam/features/login/domain/entities/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  String? token;
  LoginUserDto? user;
  int? code;
  LoginResponse({this.message, this.token, this.code});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginResponseModel toEntity() {
    return LoginResponseModel(
      message: message,
      token: token,
      code: code,
      user: LoginUserModel(
        id: user?.id,
        userName: user?.userName,
        firstName: user?.firstName,
        lastName: user?.lastName,
        email: user?.email,
        phone: user?.phone,
        role: user?.role,
        isVerified: user?.isVerified,
        createdAt: user?.createdAt,
      ),
    );
  }
}
