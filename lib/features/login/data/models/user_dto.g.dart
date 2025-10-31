// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserDto _$LoginUserDtoFromJson(Map<String, dynamic> json) => LoginUserDto(
  id: json['_id'] as String?,
  userName: json['username'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  isVerified: json['isVerified'] as bool?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$LoginUserDtoToJson(LoginUserDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt,
    };
