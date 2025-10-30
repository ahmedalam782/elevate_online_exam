import 'package:elevate_online_exam/features/login/domain/entities/user_model.dart';

class LoginResponseModel {
   String? message;
   String? token;
   UserModel? user;
   int? code;
  LoginResponseModel({this.message, this.token, this.code, this.user});
  
}