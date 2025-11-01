import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordStates extends Equatable {
  final FormValidChangedState? formValidChangedState;
  final PageChangedState? pageChangedState;
  final ObscureTextChangedState? obscureNewPasswordTextChangedState;
  final ObscureTextChangedState? obscureConfirmNewPasswordTextChangedState;
  final SendCodeToEmailState? sendCodeToEmailState;
  final ResendCodeToEmailState? resendCodeToEmailState;
  final VerifyCodeState? verifyCodeState;
  final ResetPasswordState? resetPasswordState;

  const ForgetPasswordStates({
    this.formValidChangedState = const FormValidChangedState(isValid: false),
    this.pageChangedState = const PageChangedState(currentPage: 0),
    this.obscureNewPasswordTextChangedState = const ObscureTextChangedState(
      isObscure: true,
    ),
    this.sendCodeToEmailState = const SendCodeToEmailState(),
    this.verifyCodeState = const VerifyCodeState(),
    this.resetPasswordState = const ResetPasswordState(),
    this.resendCodeToEmailState = const ResendCodeToEmailState(),
    this.obscureConfirmNewPasswordTextChangedState =
        const ObscureTextChangedState(isObscure: true),
  });

  ForgetPasswordStates copyWith({
    FormValidChangedState? formValidChangedState,
    PageChangedState? pageChangedState,
    ObscureTextChangedState? obscureNewPasswordTextChangedState,
    ObscureTextChangedState? obscureConfirmNewPasswordTextChangedState,
    SendCodeToEmailState? sendCodeToEmailState,
    VerifyCodeState? verifyCodeState,
    ResetPasswordState? resetPasswordState,
    ResendCodeToEmailState? resendCodeToEmailState,
  }) {
    return ForgetPasswordStates(
      formValidChangedState:
          formValidChangedState ?? this.formValidChangedState,
      pageChangedState: pageChangedState ?? this.pageChangedState,
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
    );
  }

  @override
  List<Object?> get props => [
    formValidChangedState,
    pageChangedState,
    obscureNewPasswordTextChangedState,
    obscureConfirmNewPasswordTextChangedState,
    sendCodeToEmailState,
    verifyCodeState,
    resetPasswordState,
    resendCodeToEmailState,
  ];

  @override
  String toString() {
    return "ForgetPasswordStates(formValidChangedState: $formValidChangedState , pageChangedState: $pageChangedState, obscureNewPasswordTextChangedState: $obscureNewPasswordTextChangedState, obscureConfirmNewPasswordTextChangedState: $obscureConfirmNewPasswordTextChangedState , sendCodeToEmailState: $sendCodeToEmailState, verifyCodeState: $verifyCodeState, resetPasswordState: $resetPasswordState, resendCodeToEmailState: $resendCodeToEmailState)";
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

class PageChangedState extends Equatable {
  final int currentPage;

  const PageChangedState({required this.currentPage});

  @override
  List<Object?> get props => [currentPage];

  @override
  String toString() {
    return "PageChangedState(currentPage: $currentPage)";
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
