import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_text_field.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_cubit.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_events.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    return Form(
      child: Column(
        children: [
          BlocSelector<
            ChangePasswordCubit,
            ChangePasswordStates,
            PasswordFieldState
          >(
            selector: (state) {
              return state.oldPassword;
            },
            builder: (context, state) {
              return CustomTextFormField(
                controller: cubit.currentPasswordController,
                labelText: LocaleKeys.change_password_current_password.tr(),
                hintText: LocaleKeys.change_password_current_password.tr(),
                isObscureText: state.isObscure,
                hintStyle: Styles.regular(context, 14, color: AppColors.grayA6),
                fillColor: AppColors.backgroundLight,
                textInputType: TextInputType.visiblePassword,
                errorText: state.error,
                suffixWidget: IconButton(
                  onPressed: () {
                    cubit.doIntent( 
                      ChangePasswordEvents.toggleOldPasswordVisibilityEvent(),
                    );
                  },
                  icon: Icon(
                    state.isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.gray53,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16.h),
          BlocSelector<
            ChangePasswordCubit,
            ChangePasswordStates,
            PasswordFieldState
          >(
            selector: (state) {
              return state.newPassword;
            },
            builder: (context, state) {
              return CustomTextFormField(
                controller: cubit.newPasswordController,
                labelText: LocaleKeys.change_password_new_password.tr(),
                hintText: LocaleKeys.change_password_new_password.tr(),
                isObscureText: state.isObscure,
                hintStyle: Styles.regular(context, 14, color: AppColors.grayA6),
                fillColor: AppColors.backgroundLight,
                textInputType: TextInputType.visiblePassword,
                errorText: state.error,
                suffixWidget: IconButton(
                  onPressed: () {
                    cubit.doIntent( 
                      ChangePasswordEvents.toggleNewPasswordVisibilityEvent(),
                    );
                  },
                  icon: Icon(
                    state.isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.gray53,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16.h),
          BlocSelector<
            ChangePasswordCubit,
            ChangePasswordStates,
            PasswordFieldState
          >(
            selector: (state) {
              return state.confirmPassword;
            },
            builder: (context, state) {
              return CustomTextFormField(
                controller: cubit.confirmPasswordController,
                labelText: LocaleKeys.change_password_confirm_password.tr(),
                hintText: LocaleKeys.change_password_confirm_password.tr(),
                errorText: state.error,
                isObscureText: state.isObscure,
                hintStyle: Styles.regular(context, 14, color: AppColors.grayA6),
                fillColor: AppColors.backgroundLight,
                textInputType: TextInputType.visiblePassword,
                suffixWidget: IconButton(
                  onPressed: () {
                    cubit.doIntent( 
                      ChangePasswordEvents.toggleConfirmPasswordVisibilityEvent(),
                    );
                  },
                  icon: Icon(
                    state.isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.gray53,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
