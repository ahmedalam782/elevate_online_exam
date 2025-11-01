import 'package:equatable/equatable.dart';

class ForgetPasswordStates extends Equatable {
  final FormValidChangedState? formValidChangedState;
  final PageChangedState? pageChangedState;
  final ObscureTextChangedState? obscureNewPasswordTextChangedState;
  final ObscureTextChangedState? obscureConfirmNewPasswordTextChangedState;

  const ForgetPasswordStates({
    this.formValidChangedState = const FormValidChangedState(isValid: false),
    this.pageChangedState = const PageChangedState(currentPage: 0),
    this.obscureNewPasswordTextChangedState = const ObscureTextChangedState(
      isObscure: true,
    ),
    this.obscureConfirmNewPasswordTextChangedState =
        const ObscureTextChangedState(isObscure: true),
  });

  ForgetPasswordStates copyWith({
    FormValidChangedState? formValidChangedState,
    PageChangedState? pageChangedState,
    ObscureTextChangedState? obscureNewPasswordTextChangedState,
    ObscureTextChangedState? obscureConfirmNewPasswordTextChangedState,
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
    );
  }

  @override
  List<Object?> get props => [
    formValidChangedState,
    pageChangedState,
    obscureNewPasswordTextChangedState,
    obscureConfirmNewPasswordTextChangedState,
  ];

  @override
  String toString() {
    return "ForgetPasswordStates(formValidChangedState: $formValidChangedState , pageChangedState: $pageChangedState, obscureNewPasswordTextChangedState: $obscureNewPasswordTextChangedState, obscureConfirmNewPasswordTextChangedState: $obscureConfirmNewPasswordTextChangedState)";
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
