import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'params.g.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class PaginationParams extends Equatable {
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'limit')
  final int limit;

  const PaginationParams({required this.page, required this.limit});
  factory PaginationParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamsFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationParamsToJson(this);
  @override
  List<Object?> get props => [page, limit];
}

@JsonSerializable()
class FilterParams extends Equatable {
  @JsonKey(name: 'search')
  final String? searchQuery;

  const FilterParams({this.searchQuery});

  factory FilterParams.fromJson(Map<String, dynamic> json) =>
      _$FilterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$FilterParamsToJson(this);

  @override
  List<Object?> get props => [searchQuery];
}

// !  Forget Password Params

class ForgetPasswordParams extends Equatable {
  final String? email;
  final String? code;
  final String? newPassword;

  const ForgetPasswordParams({this.email, this.code, this.newPassword});

  factory ForgetPasswordParams.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordParams(
        email: json['email'] as String?,
        code: json['resetCode'] as String?,
        newPassword: json['newPassword'] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (email != null) data['email'] = email;
    if (code != null) data['resetCode'] = code;
    if (newPassword != null) data['newPassword'] = newPassword;
    return data;
  }

  ForgetPasswordParams copyWith({
    String? email,
    String? code,
    String? newPassword,
  }) {
    return ForgetPasswordParams(
      email: email ?? this.email,
      code: code ?? this.code,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  @override
  List<Object?> get props => [email, code, newPassword];
}

class EditProfileParams extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? username;

  const EditProfileParams({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.username,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (firstName != null) data['firstName'] = firstName;
    if (lastName != null) data['lastName'] = lastName;
    if (phone != null) data['phone'] = phone;
    if (email != null) data['email'] = email;
    if (username != null) data['username'] = username;
    return data;
  }

  EditProfileParams copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? username,
  }) {
    return EditProfileParams(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, phone, email, username];
}
