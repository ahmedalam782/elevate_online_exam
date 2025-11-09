import 'package:elevate_online_exam/features/login/data/models/user_dto.dart';
import 'package:elevate_online_exam/features/login/domain/entities/login_response_entity.dart';
import 'package:elevate_online_exam/features/login/domain/entities/user_model_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  String? token;
  LoginUserDto? user;
  int? code;
  LoginResponse({this.message, this.token, this.code, this.user});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginResponseModel toEntity() {
    return LoginResponseModel(
      message: message,
      token: token,
      code: code,
      user: LoginUserEntity(
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
