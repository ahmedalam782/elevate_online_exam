// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      userDto: json['userDto'] == null
          ? null
          : UserDto.fromJson(json['userDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'userDto': instance.userDto,
    };
