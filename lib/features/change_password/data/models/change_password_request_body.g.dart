// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestBody _$ChangePasswordRequestBodyFromJson(
  Map<String, dynamic> json,
) => ChangePasswordRequestBody(
  oldPassword: json['oldPassword'] as String?,
  newPassword: json['password'] as String?,
  confirmPassword: json['rePassword'] as String?,
);

Map<String, dynamic> _$ChangePasswordRequestBodyToJson(
  ChangePasswordRequestBody instance,
) => <String, dynamic>{
  'oldPassword': instance.oldPassword,
  'password': instance.newPassword,
  'rePassword': instance.confirmPassword,
};
