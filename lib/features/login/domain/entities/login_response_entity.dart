import 'package:elevate_online_exam/features/login/domain/entities/user_model_entity.dart';

class LoginResponseModel {
  String? message;
  String? token;
  LoginUserEntity? user;
  int? code;
  LoginResponseModel({this.message, this.token, this.code, this.user});
}
