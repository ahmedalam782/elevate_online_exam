import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordStates extends Equatable {
  final FormValidChangedState? emailFormValidChangedState;
  final FormValidChangedState? codeFormValidChangedState;
  final FormValidChangedState? resetPasswordFormValidChangedState;
  final ObscureTextChangedState? obscureNewPasswordTextChangedState;
  final ObscureTextChangedState? obscureConfirmNewPasswordTextChangedState;
  final SendCodeToEmailState? sendCodeToEmailState;
  final ResendCodeToEmailState? resendCodeToEmailState;
  final VerifyCodeState? verifyCodeState;
  final ResetPasswordState? resetPasswordState;
  final NextPageState? nextPageState;

  const ForgetPasswordStates({
    this.obscureNewPasswordTextChangedState = const ObscureTextChangedState(
      isObscure: true,
    ),
    this.sendCodeToEmailState = const SendCodeToEmailState(),
    this.verifyCodeState = const VerifyCodeState(),
    this.resetPasswordState = const ResetPasswordState(),
    this.resendCodeToEmailState = const ResendCodeToEmailState(),
    this.obscureConfirmNewPasswordTextChangedState =
        const ObscureTextChangedState(isObscure: true),
    this.nextPageState = const NextPageState(currentPage: 0),
    this.emailFormValidChangedState = const FormValidChangedState(
      isValid: false,
    ),
    this.codeFormValidChangedState = const FormValidChangedState(
      isValid: false,
    ),
    this.resetPasswordFormValidChangedState = const FormValidChangedState(
      isValid: false,
    ),
  });

  ForgetPasswordStates copyWith({
    ObscureTextChangedState? obscureNewPasswordTextChangedState,
    ObscureTextChangedState? obscureConfirmNewPasswordTextChangedState,
    SendCodeToEmailState? sendCodeToEmailState,
    VerifyCodeState? verifyCodeState,
    ResetPasswordState? resetPasswordState,
    ResendCodeToEmailState? resendCodeToEmailState,
    NextPageState? nextPageState,
    FormValidChangedState? emailFormValidChangedState,
    FormValidChangedState? codeFormValidChangedState,
    FormValidChangedState? resetPasswordFormValidChangedState,
  }) {
    return ForgetPasswordStates(
      emailFormValidChangedState:
          emailFormValidChangedState ?? this.emailFormValidChangedState,
      codeFormValidChangedState:
          codeFormValidChangedState ?? this.codeFormValidChangedState,
      resetPasswordFormValidChangedState:
          resetPasswordFormValidChangedState ?? this.resetPasswordFormValidChangedState,
      obscureNewPasswordTextChangedState:
          obscureNewPasswordTextChangedState ??
          this.obscureNewPasswordTextChangedState,
      obscureConfirmNewPasswordTextChangedState:
          obscureConfirmNewPasswordTextChangedState ??
          this.obscureConfirmNewPasswordTextChangedState,
      sendCodeToEmailState: sendCodeToEmailState ?? this.sendCodeToEmailState,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resendCodeToEmailState:
          resendCodeToEmailState ?? this.resendCodeToEmailState,
      nextPageState: nextPageState ?? this.nextPageState,
    );
  }

  @override
  List<Object?> get props => [
    emailFormValidChangedState,
    codeFormValidChangedState,
    resetPasswordFormValidChangedState,
    obscureNewPasswordTextChangedState,
    obscureConfirmNewPasswordTextChangedState,
    sendCodeToEmailState,
    verifyCodeState,
    resetPasswordState,
    resendCodeToEmailState,
    nextPageState,
  ];

  @override
  String toString() {
    return "ForgetPasswordStates( emailFormValidChangedState: $emailFormValidChangedState, codeFormValidChangedState: $codeFormValidChangedState, resetFormValidChangedState: $resetPasswordFormValidChangedState, obscureNewPasswordTextChangedState: $obscureNewPasswordTextChangedState, obscureConfirmNewPasswordTextChangedState: $obscureConfirmNewPasswordTextChangedState , sendCodeToEmailState: $sendCodeToEmailState, verifyCodeState: $verifyCodeState, resetPasswordState: $resetPasswordState, resendCodeToEmailState: $resendCodeToEmailState , nextPageState: $nextPageState)";
  }
}

class FormValidChangedState extends Equatable {
  final bool isValid;

  const FormValidChangedState({required this.isValid});

  @override
  List<Object?> get props => [isValid];

  @override
  String toString() {
    return "FormValidChangedState(isValid: $isValid)";
  }
}

class NextPageState extends Equatable {
  final int currentPage;

  const NextPageState({required this.currentPage});

  @override
  List<Object?> get props => [currentPage];

  @override
  String toString() {
    return "NextPageState(currentPage: $currentPage)";
  }
}

class ObscureTextChangedState extends Equatable {
  final bool isObscure;

  const ObscureTextChangedState({required this.isObscure});

  @override
  List<Object?> get props => [isObscure];

  @override
  String toString() {
    return "ObscureTextChangedState(isObscure: $isObscure)";
  }
}

class SendCodeToEmailState extends BaseState {
  const SendCodeToEmailState({super.state, super.data, super.exception});
}

class ResendCodeToEmailState extends BaseState {
  const ResendCodeToEmailState({super.state, super.data, super.exception});
}

class VerifyCodeState extends BaseState {
  const VerifyCodeState({super.state, super.data, super.exception});
}

class ResetPasswordState extends BaseState {
  const ResetPasswordState({super.state, super.data, super.exception});
}
