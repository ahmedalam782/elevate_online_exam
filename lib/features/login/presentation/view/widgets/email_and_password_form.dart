import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_text_field.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/validations/validations.dart';
import 'package:elevate_online_exam/features/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPasswordForm extends StatelessWidget {
  const EmailAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
            validator:(value) {
              if (Validations.validateEmail(value) != null) {
                return Validations.validateEmail(value);
              }
              return null;
            },
            hintText: LocaleKeys.login_email_hint.tr(),
            fillColor: AppColors.backgroundLight,
            labelWidget: Text(LocaleKeys.login_email_label.tr()),
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 24.h),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) => Validations.validatePassword(value),
            hintText: LocaleKeys.login_password_hint.tr(),
            fillColor: AppColors.backgroundLight,
            labelWidget: Text(LocaleKeys.login_password_label.tr()),
            isObscureText: true,
            maxLine: 1,
          ),
        ],
      ),
    );
  }
}
