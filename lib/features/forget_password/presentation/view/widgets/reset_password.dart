import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_text_field.dart';
import 'package:elevate_online_exam/features/forget_password/presentation/view_model/cubit/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/errors/handle_errors/handle_errors.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_toast.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/validations/validations.dart';
import '../../view_model/cubit/forget_password_cubit.dart';
import '../../view_model/cubit/forget_password_events.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordCubit forgetPasswordCubit = context
        .read<ForgetPasswordCubit>();
    return Form(
      key: forgetPasswordCubit.resetFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.forget_password_reset_password.tr(),
                  style: Styles.medium(
                    context,
                    18,
                    color: AppColors.onBackgroundLight,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.forget_password_password_requirements.tr(),
                  style: Styles.regular(context, 14, color: AppColors.gray53),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
            builder: (context, state) {
              return CustomTextFormField(
                controller: forgetPasswordCubit.newPasswordController,
                labelText: LocaleKeys.forget_password_new_password.tr(),
                hintText: LocaleKeys.forget_password_enter_your_password.tr(),
                textInputType: TextInputType.visiblePassword,
                isObscureText:
                    state.obscureNewPasswordTextChangedState?.isObscure ?? true,
                maxLine: 1,
                validator: (value) => Validations.validatePassword(value!),
                suffixWidget: IconButton(
                  onPressed: () {
                    forgetPasswordCubit.doIndented(
                      ObscureTextChangedEvent(
                        LocaleKeys.forget_password_new_password,
                      ),
                    );
                  },
                  icon: Icon(
                    state.obscureNewPasswordTextChangedState?.isObscure == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.gray87,
                  ),
                ),
                onChanged: (_) {
                  forgetPasswordCubit.doIndented(
                    FormValidChangedEvent(forgetPasswordCubit.resetFormKey),
                  );
                },
                onFieldSubmitted: (_) {
                  forgetPasswordCubit.doIndented(
                    FormValidChangedEvent(forgetPasswordCubit.resetFormKey),
                  );
                },
              );
            },
          ),
          SizedBox(height: 16),
          BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
            builder: (context, state) {
              return CustomTextFormField(
                controller: forgetPasswordCubit.confirmNewPasswordController,
                labelText: LocaleKeys.forget_password_confirm_password.tr(),
                hintText: LocaleKeys.forget_password_confirm_password.tr(),
                textInputType: TextInputType.visiblePassword,
                isObscureText:
                    state
                        .obscureConfirmNewPasswordTextChangedState
                        ?.isObscure ??
                    true,
                maxLine: 1,
                validator: (value) => Validations.validatePasswordVerification(
                  value!,
                  forgetPasswordCubit.newPasswordController.text,
                ),
                suffixWidget: IconButton(
                  onPressed: () {
                    forgetPasswordCubit.doIndented(
                      ObscureTextChangedEvent(
                        LocaleKeys.forget_password_confirm_password,
                      ),
                    );
                  },
                  icon: Icon(
                    state
                                .obscureConfirmNewPasswordTextChangedState
                                ?.isObscure ==
                            true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.gray87,
                  ),
                ),
                onChanged: (_) {
                  forgetPasswordCubit.doIndented(
                    FormValidChangedEvent(forgetPasswordCubit.resetFormKey),
                  );
                },
                onFieldSubmitted: (_) {
                  forgetPasswordCubit.doIndented(
                    FormValidChangedEvent(forgetPasswordCubit.resetFormKey),
                  );
                },
              );
            },
          ),
          SizedBox(height: 32),
          BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state.resetPasswordState!.state == StateType.loading,
                title: LocaleKeys.forget_password_continue.tr(),
                onTap: state.formValidChangedState!.isValid
                    ? () {
                        forgetPasswordCubit.doIndented(ResetPasswordEvent());
                      }
                    : null,
              );
            },
            listener: (context, state) {
              if (state.resetPasswordState!.state == StateType.success) {
                CustomToast(
                  context: context,
                  header: LocaleKeys.forget_password_password_reset_success
                      .tr(),
                  type: ToastificationType.success,
                ).showToast();
                context.go(Routes.login);
              } else if (state.resetPasswordState!.state == StateType.error) {
                bool hasNetworkError = handleNetwork(
                  state.resetPasswordState!.exception!,
                );
                CustomToast(
                  context: context,
                  header: hasNetworkError
                      ? LocaleKeys.global_check_internet.tr()
                      : handleError(state.resetPasswordState!.exception!),
                  type: ToastificationType.error,
                ).showToast();
              }
            },
          ),
        ],
      ),
    );
  }
}
