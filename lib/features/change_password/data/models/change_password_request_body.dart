import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_params.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_password_request_body.g.dart';
@JsonSerializable()
class ChangePasswordRequestBody {
  final String? oldPassword;
  @JsonKey(name: 'password')
  final String? newPassword;
  @JsonKey(name: 'rePassword')
  final String? confirmPassword;

  ChangePasswordRequestBody({
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordRequestBodyToJson(this);

  factory ChangePasswordRequestBody.fromEntity(
      ChangePasswordParams params) {
    return ChangePasswordRequestBody(
      oldPassword: params.oldPassword,
      newPassword: params.newPassword,
      confirmPassword: params.newPassword,
    );
  }
 
}
