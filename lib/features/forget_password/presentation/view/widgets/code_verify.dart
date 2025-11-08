import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/errors/handle_errors/handle_errors.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/shared/widgets/custom_pin_input.dart';
import '../../../../../core/shared/widgets/custom_toast.dart';
import '../../../../../core/shared/widgets/resend_timer_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/validations/validations.dart';
import '../../view_model/cubit/forget_password_cubit.dart';
import '../../view_model/cubit/forget_password_events.dart';
import '../../view_model/cubit/forget_password_states.dart';
import '../../../../../core/shared/widgets/show_loading_dialog.dart';

class CodeVerify extends StatelessWidget {
  const CodeVerify({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordCubit forgetPasswordCubit = context
        .read<ForgetPasswordCubit>();
    return Form(
      key: forgetPasswordCubit.codeFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.forget_password_email_verification.tr(),
                  style: Styles.medium(
                    context,
                    18,
                    color: AppColors.onBackgroundLight,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.forget_password_email_verification_message.tr(),
                  style: Styles.regular(context, 14, color: AppColors.gray53),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
            listenWhen: (previous, current) =>
                previous.verifyCodeState?.state !=
                current.verifyCodeState?.state,
            listener: (context, state) {
              if (state.verifyCodeState!.state == StateType.loading) {
                showDialogLoading(context);
              } else if (state.verifyCodeState!.state == StateType.success) {
                if (context.canPop()) {
                  context.pop();
                }
                CustomToast(
                  context: context,
                  header: LocaleKeys.forget_password_code_correct.tr(),
                  type: ToastificationType.success,
                ).showToast();
              } else if (state.verifyCodeState!.state == StateType.error) {
                if (context.canPop()) {
                  context.pop();
                }
                bool hasNetworkError = handleNetwork(
                  state.verifyCodeState!.exception!,
                );
                CustomToast(
                  context: context,
                  header: hasNetworkError
                      ? LocaleKeys.global_check_internet.tr()
                      : handleError(state.verifyCodeState!.exception!),
                  type: ToastificationType.error,
                ).showToast();
              }
            },
            child: CustomPinInput(
              length: 6,
              controller: forgetPasswordCubit.codeController,
              validator: (value) => Validations.validatePin(value, 6),
              onChange: (_) {
                forgetPasswordCubit.doIndented(CodeFormValidChangedEvent());
                if (forgetPasswordCubit.codeFormKey.currentState!.validate()) {
                  forgetPasswordCubit.doIndented(VerifyCodeEvent());
                }
              },
              onSubmitted: (_) {
                forgetPasswordCubit.doIndented(CodeFormValidChangedEvent());
                if (forgetPasswordCubit.codeFormKey.currentState!.validate()) {
                  forgetPasswordCubit.doIndented(VerifyCodeEvent());
                }
              },
            ),
          ),
          SizedBox(height: 16),
          BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
            listener: (context, state) {
              if (state.resendCodeToEmailState!.state == StateType.success) {
                CustomToast(
                  context: context,
                  header: LocaleKeys.forget_password_email_sent_message.tr(),
                  type: ToastificationType.success,
                ).showToast();
              } else if (state.resendCodeToEmailState!.state ==
                  StateType.error) {
                bool hasNetworkError = handleNetwork(
                  state.resendCodeToEmailState!.exception!,
                );
                CustomToast(
                  context: context,
                  header: hasNetworkError
                      ? LocaleKeys.global_check_internet.tr()
                      : handleError(state.resendCodeToEmailState!.exception!),
                  type: ToastificationType.error,
                ).showToast();
              }
            },
            child: ResendTimer(
              onResend: () {
                forgetPasswordCubit.doIndented(ResendCodeToEmailEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}
