import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/validations/validations.dart';
import 'package:elevate_online_exam/features/forget_password/presentation/view_model/cubit/forget_password_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/shared/widgets/custom_pin_input.dart';
import '../../../../../core/shared/widgets/resend_timer_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../view_model/cubit/forget_password_cubit.dart';

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
          CustomPinInput(
            length: 4,
            controller: forgetPasswordCubit.codeController,
            validator: (value) => Validations.validatePin(value, 4),
            onChange: (_) {
              forgetPasswordCubit.doIndented(
                FormValidChangedEvent(forgetPasswordCubit.codeFormKey),
              );
            },
            onSubmitted: (_) {
              forgetPasswordCubit.doIndented(
                FormValidChangedEvent(forgetPasswordCubit.codeFormKey),
              );
              forgetPasswordCubit.doIndented(NextPageEvent());
            },
          ),
          SizedBox(height: 16),
          ResendTimer(onResend: () {}),
        ],
      ),
    );
  }
}
