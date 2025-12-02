import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Equatable {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'user')
  final User? user;

  const ProfileModel({this.message, this.user});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  ProfileModel copyWith({String? message, User? user}) {
    return ProfileModel(
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [message, user];
}
