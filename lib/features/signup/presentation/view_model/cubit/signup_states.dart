// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/signup/domain/models/user_entity.dart';

// ignore: must_be_immutable
class SignupStates extends BaseState<UserEntity> {
  bool isPasswordVisible;
  bool isConfirmPasswordVisible;

  SignupStates.all({
    super.exception,
    super.data,
    required super.state,
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
  }) : super.all();

  // SignupStates({required});

  // SignupStates.all({super.exception, super.data, required super.state})
  //   : super.all();

  SignupStates copyWith({
    StateType? state,
    UserEntity? data,
    Exception? exception,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return SignupStates.all(
      state: state ?? this.state,
      data: data ?? this.data,
      exception: exception ?? this.exception,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }
}
