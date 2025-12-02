import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/core/errors/handle_errors/handle_errors.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_toast.dart';
import 'package:elevate_online_exam/core/validations/validations.dart';
import 'package:elevate_online_exam/features/change_password/domain/entities/change_password_params.dart';
import 'package:elevate_online_exam/features/change_password/domain/use_cases/change_password_use_case.dart';
import 'package:elevate_online_exam/features/change_password/domain/use_cases/save_new_token_use_case.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_events.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:toastification/toastification.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit(this._changePasswordUseCase, this._saveNewTokenUseCase)
    : super(ChangePasswordStates());

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final ChangePasswordUseCase _changePasswordUseCase;
  final SaveNewTokenUseCase _saveNewTokenUseCase;

  void doIntent(ChangePasswordEvents event) {
    event.when(
      toggleOldPasswordVisibilityEvent: _toggleOldPasswordVisibility,
      toggleNewPasswordVisibilityEvent: _toggleNewPasswordVisibility,
      toggleConfirmPasswordVisibilityEvent: _toggleConfirmPasswordVisibility,
      submitChangePasswordEvent: _submit,
    );
  }

  void _toggleOldPasswordVisibility() {
    emit(
      state.copyWith(
        oldPassword: state.oldPassword.copyWith(
          isObscure: !state.oldPassword.isObscure,
        ),
      ),
    );
  }

  void _toggleNewPasswordVisibility() {
    emit(
      state.copyWith(
        newPassword: state.newPassword.copyWith(
          isObscure: !state.newPassword.isObscure,
        ),
      ),
    );
  }

  void _toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(
        confirmPassword: state.confirmPassword.copyWith(
          isObscure: !state.confirmPassword.isObscure,
        ),
      ),
    );
  }

  void showToast(BuildContext context, Exception exception) {
    CustomToast(
      context: context,
      description: handleError(exception),
      type: ToastificationType.error,
    ).showToast();
  }

  bool _validate() {
    bool valid = true;

    String old = currentPasswordController.text;
    String newPwd = newPasswordController.text;
    String confirm = confirmPasswordController.text;

    PasswordFieldState oldState = state.oldPassword;
    PasswordFieldState newState = state.newPassword;
    PasswordFieldState confirmState = state.confirmPassword;

    // OLD PASSWORD
    String? oldError = Validations.validatePassword(old);
    if (old.isEmpty) {
      oldState = oldState.copyWith(
        error: LocaleKeys.change_password_enter_current_password.tr(),
      );
      valid = false;
    } else if (oldError != null) {
      oldState = oldState.copyWith(error: oldError);
      valid = false;
    } else {
      oldState = oldState.copyWith(error: null, clearError: true);
    }

    // NEW PASSWORD
    String? newError = Validations.validatePassword(newPwd);
    if (newPwd.isEmpty) {
      newState = newState.copyWith(
        error: LocaleKeys.change_password_enter_new_password.tr(),
      );
      valid = false;
    } else if (newError != null) {
      newState = newState.copyWith(error: newError);
      valid = false;
    } else {
      newState = newState.copyWith(error: null, clearError: true);
    }

    // CONFIRM PASSWORD
    if (confirm.isEmpty) {
      confirmState = confirmState.copyWith(
        error: LocaleKeys.change_password_enter_confirm_password.tr(),
      );
      valid = false;
    } else if (confirm != newPwd) {
      confirmState = confirmState.copyWith(
        error: LocaleKeys.change_password_new_passwords_do_not_match.tr(),
      );
      valid = false;
    } else {
      confirmState = confirmState.copyWith(error: null, clearError: true);
    }
    emit(
      state.copyWith(
        oldPassword: oldState,
        newPassword: newState,
        confirmPassword: confirmState,
      ),
    );

    return valid;
  }

  Future<void> _submit() async {
    if (!_validate()) return;

    emit(state.copyWith(changePasswordState: const BaseState.loading()));

    final result = await _changePasswordUseCase.call(
      params: ChangePasswordParams(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      ),
    );
    final String errorFilter = "old password";
    result.when(
      success: (data) {
        if (data != null && data.token != null) {
          _saveNewTokenUseCase.call(token: data.token!);
        }
        return emit(
          state.copyWith(changePasswordState: BaseState.success(data)),
        );
      },
      error: (error) {
        final errorMessage = handleError(error);
        if (errorMessage != null) {
          if (errorMessage.contains(errorFilter)) {
            emit(
              state.copyWith(
                oldPassword: state.oldPassword.copyWith(error: errorMessage),
              ),
            );
          }
        }

        return emit(
          state.copyWith(changePasswordState: BaseState.error(error)),
        );
      },
    );
  }

  void _clearControllers() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    _clearControllers();
    return super.close();
  }
}
