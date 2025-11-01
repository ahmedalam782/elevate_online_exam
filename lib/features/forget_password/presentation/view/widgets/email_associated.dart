import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/errors/handle_errors/handle_errors.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/validations/validations.dart';
import '../../view_model/cubit/forget_password_cubit.dart';
import '../../view_model/cubit/forget_password_events.dart';
import '../../view_model/cubit/forget_password_states.dart';

class EmailAssociated extends StatelessWidget {
  const EmailAssociated({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordCubit forgetPasswordCubit = context
        .read<ForgetPasswordCubit>();
    return Form(
      key: forgetPasswordCubit.emailFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.forget_password_title.tr(),
                  style: Styles.medium(
                    context,
                    18,
                    color: AppColors.onBackgroundLight,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.forget_password_message.tr(),
                  style: Styles.regular(context, 14, color: AppColors.gray53),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          CustomTextFormField(
            controller: forgetPasswordCubit.emailController,
            labelText: LocaleKeys.forget_password_email_label.tr(),
            hintText: LocaleKeys.forget_password_email_hint.tr(),
            textInputType: TextInputType.emailAddress,
            validator: Validations.validateEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (_) {
              forgetPasswordCubit.doIndented(
                FormValidChangedEvent(forgetPasswordCubit.emailFormKey),
              );
            },
            onFieldSubmitted: (_) {
              forgetPasswordCubit.doIndented(
                FormValidChangedEvent(forgetPasswordCubit.emailFormKey),
              );
            },
          ),
          SizedBox(height: 24),
          BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
            builder: (context, state) {
              return CustomButton(
                isLoading:
                    state.sendCodeToEmailState!.state == StateType.loading,
                title: LocaleKeys.forget_password_continue.tr(),
                onTap: state.formValidChangedState!.isValid
                    ? () {
                        forgetPasswordCubit.doIndented(
                          SendCodeToEmailEvent(),
                        );
                      }
                    : null,
              );
            },
            listener: (context, state) {
              if (state.sendCodeToEmailState!.state == StateType.success) {
                CustomToast(
                  context: context,
                  header: LocaleKeys.forget_password_email_sent_message.tr(),
                  type: ToastificationType.success,
                ).showToast();
              } else if (state.sendCodeToEmailState!.state == StateType.error) {
                bool hasNetworkError = handleNetwork(
                  state.sendCodeToEmailState!.exception!,
                );
                CustomToast(
                  context: context,
                  header: hasNetworkError
                      ? LocaleKeys.global_check_internet.tr()
                      : handleError(state.sendCodeToEmailState!.exception!),
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
