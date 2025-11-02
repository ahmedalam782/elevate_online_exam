import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/features/forget_password/presentation/view/widgets/reset_password.dart'
    show ResetPassword;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/helper/classes/params.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../domain/use_cases/forget_password_use_case.dart';
import '../../../domain/use_cases/reset_password_use_case.dart';
import '../../../domain/use_cases/verify_reset_code_use_case.dart';
import '../../view/widgets/code_verify.dart';
import '../../view/widgets/email_associated.dart';
import 'forget_password_events.dart';
import 'forget_password_states.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit(
    this._forgetPasswordUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(const ForgetPasswordStates());
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  // ! Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  // ! Form Keys
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  // ! Page View
  List<Widget> children = [EmailAssociated(), CodeVerify(), ResetPassword()];
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void emit(ForgetPasswordStates state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  // ! Events Handler
  void doIndented(ForgetPasswordEvents event) {
    switch (event) {
      case EmailFormValidChangedEvent():
        _emailFormValidChanged();
        break;
      case CodeFormValidChangedEvent():
        _codeFormValidChanged();
        break;
      case ResetFormValidChangedEvent():
        _resetPasswordFormValidChanged();
        break;
      case NextPageEvent():
        _nextPage();
        break;
      case ObscureTextChangedEvent():
        _obscureTextChanged(event.fieldKey);
        break;
      case SendCodeToEmailEvent():
        _forgetPassword();
        break;
      case ResendCodeToEmailEvent():
        resendCode();
        break;
      case VerifyCodeEvent():
        _verifyResetCode();
        break;
      case ResetPasswordEvent():
        _resetPassword();
        break;
    }
  }

  // ! Form email Valid Changed
  void _emailFormValidChanged() {
    bool isValid = emailFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      emit(
        state.copyWith(
          sendCodeToEmailState: const SendCodeToEmailState(
            state: StateType.initial,
          ),
        ),
      );
    }
    emit(
      state.copyWith(
        emailFormValidChangedState: FormValidChangedState(isValid: isValid),
      ),
    );
  }

  // ! Form Code Valid Changed
  void _codeFormValidChanged() {
    bool isValid = codeFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      emit(
        state.copyWith(
          verifyCodeState: const VerifyCodeState(state: StateType.initial),
          resendCodeToEmailState: const ResendCodeToEmailState(
            state: StateType.initial,
          ),
        ),
      );
    }
    emit(
      state.copyWith(
        codeFormValidChangedState: FormValidChangedState(isValid: isValid),
      ),
    );
  }

  // ! Form Reset Valid Changed
  void _resetPasswordFormValidChanged() {
    bool isValid = resetPasswordFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      emit(
        state.copyWith(
          resetPasswordState: const ResetPasswordState(
            state: StateType.initial,
          ),
        ),
      );
    }
    emit(
      state.copyWith(
        resetPasswordFormValidChangedState: FormValidChangedState(
          isValid: isValid,
        ),
      ),
    );
  }

  // ! Next Page
  void _nextPage() {
    if (currentPage < children.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      emit(
        state.copyWith(nextPageState: NextPageState(currentPage: currentPage)),
      );
    }
  }

  // ! Obscure Text Changed
  void _obscureTextChanged(String fieldType) {
    if (fieldType == LocaleKeys.forget_password_new_password) {
      bool isObscure =
          !(state.obscureNewPasswordTextChangedState?.isObscure ?? true);
      emit(
        state.copyWith(
          obscureNewPasswordTextChangedState: ObscureTextChangedState(
            isObscure: isObscure,
          ),
        ),
      );
    } else if (fieldType == LocaleKeys.forget_password_confirm_password) {
      bool isObscure =
          !(state.obscureConfirmNewPasswordTextChangedState?.isObscure ?? true);
      emit(
        state.copyWith(
          obscureConfirmNewPasswordTextChangedState: ObscureTextChangedState(
            isObscure: isObscure,
          ),
        ),
      );
    }
  }

  // ! Clear Controllers
  void _clear() {
    emailController.clear();
    codeController.clear();
    newPasswordController.clear();
    confirmNewPasswordController.clear();
  }

  // ! forgetPassword use case
  Future<void> _forgetPassword() async {
    emit(
      state.copyWith(
        sendCodeToEmailState: const SendCodeToEmailState(
          state: StateType.loading,
        ),
      ),
    );
    final result = await _forgetPasswordUseCase(
      ForgetPasswordParams(email: emailController.text.trim()),
    );
    switch (result) {
      case Success():
        _nextPage();
        emit(
          state.copyWith(
            sendCodeToEmailState: const SendCodeToEmailState(
              state: StateType.success,
            ),
          ),
        );
        break;
      case Error():
        emit(
          state.copyWith(
            sendCodeToEmailState: SendCodeToEmailState(
              state: StateType.error,
              exception: result.exception,
            ),
          ),
        );
        break;
    }
  }

  //! resend code use case
  Future<void> resendCode() async {
    emit(
      state.copyWith(
        verifyCodeState: const VerifyCodeState(state: StateType.initial),
      ),
    );
    emit(
      state.copyWith(
        resendCodeToEmailState: const ResendCodeToEmailState(
          state: StateType.loading,
        ),
      ),
    );
    final result = await _forgetPasswordUseCase(
      ForgetPasswordParams(email: emailController.text.trim()),
    );
    switch (result) {
      case Success():
        emit(
          state.copyWith(
            resendCodeToEmailState: const ResendCodeToEmailState(
              state: StateType.success,
            ),
          ),
        );
        break;
      case Error():
        emit(
          state.copyWith(
            resendCodeToEmailState: ResendCodeToEmailState(
              state: StateType.error,
              exception: result.exception,
            ),
          ),
        );
        break;
    }
  }

  // ! verifyResetCode use case
  Future<void> _verifyResetCode() async {
    final isValid = codeFormKey.currentState?.validate() ?? false;
    if (!isValid) return;
    emit(
      state.copyWith(
        resendCodeToEmailState: const ResendCodeToEmailState(
          state: StateType.initial,
        ),
      ),
    );
    emit(
      state.copyWith(
        verifyCodeState: const VerifyCodeState(state: StateType.loading),
      ),
    );
    final result = await _verifyResetCodeUseCase(
      ForgetPasswordParams(
        email: emailController.text.trim(),
        code: codeController.text.trim(),
      ),
    );
    switch (result) {
      case Success():
        _nextPage();
        emit(
          state.copyWith(
            verifyCodeState: const VerifyCodeState(state: StateType.success),
          ),
        );
        break;
      case Error():
        emit(
          state.copyWith(
            verifyCodeState: VerifyCodeState(
              state: StateType.error,
              exception: result.exception,
            ),
          ),
        );
        break;
    }
  }

  // ! resetPassword use case
  Future<void> _resetPassword() async {
    emit(
      state.copyWith(
        resetPasswordState: const ResetPasswordState(state: StateType.loading),
      ),
    );
    final result = await _resetPasswordUseCase(
      ForgetPasswordParams(
        email: emailController.text.trim(),
        code: codeController.text.trim(),
        newPassword: newPasswordController.text.trim(),
      ),
    );
    switch (result) {
      case Success():
        emit(
          state.copyWith(
            resetPasswordState: const ResetPasswordState(
              state: StateType.success,
            ),
          ),
        );
        break;
      case Error():
        emit(
          state.copyWith(
            resetPasswordState: ResetPasswordState(
              state: StateType.error,
              exception: result.exception,
            ),
          ),
        );
        break;
    }
  }

  @override
  Future<void> close() {
    _clear();
    emailController.dispose();
    codeController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    pageController.dispose();
    return super.close();
  }
}
