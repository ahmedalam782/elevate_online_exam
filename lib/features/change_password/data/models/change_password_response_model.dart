import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_password_response_model.g.dart';
@JsonSerializable()
class ChangePasswordResponseModel {
  final String message;
  final String? token;
  final int? code;

  ChangePasswordResponseModel({
    required this.message,
    this.token,
    this.code,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseModelFromJson(json);

  ChangePasswordResponseEntity toEntity() {
    return ChangePasswordResponseEntity(
      message: message,
      token: token,
    );
  }

}