import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_text_field.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPasswordForm extends StatelessWidget {
  const EmailAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            hintText: LocaleKeys.login_email_hint.tr(),
            fillColor: AppColors.backgroundLight,
            labelWidget: Text(LocaleKeys.login_email_label.tr()),
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 24.h),
          CustomTextFormField(
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
