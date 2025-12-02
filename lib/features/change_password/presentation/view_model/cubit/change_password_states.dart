import 'package:elevate_online_exam/core/config/base_state/base_state.dart';

class ChangePasswordStates  {
  ChangePasswordStates({
    this.changePasswordState = const BaseState.initial(),
    this.oldPassword = const PasswordFieldState(),
    this.newPassword = const PasswordFieldState(),
    this.confirmPassword = const PasswordFieldState(),
  });
  BaseState changePasswordState;
  final PasswordFieldState oldPassword;
  final PasswordFieldState newPassword;
  final PasswordFieldState confirmPassword;
  ChangePasswordStates copyWith({
    BaseState? changePasswordState,
    PasswordFieldState? oldPassword,
    PasswordFieldState? newPassword,
    PasswordFieldState? confirmPassword,
  }) {
    return ChangePasswordStates(
      changePasswordState: changePasswordState ?? this.changePasswordState,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

class PasswordFieldState  {
  final bool isObscure;
  final String? error;

  const PasswordFieldState({this.isObscure = true, this.error});

  PasswordFieldState copyWith({
    bool? isObscure,
    String? error,
    bool clearError = false,
  }) {
    return PasswordFieldState(
      isObscure: isObscure ?? this.isObscure,
      error: clearError ? null : error ?? this.error,
    );
  }
}
