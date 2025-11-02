import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: LocaleKeys.login_no_account.tr(),
        style: Styles.regular(context, 16) ,
        children: [
          TextSpan(
            text: LocaleKeys.login_sign_up.tr(),
            style: Styles.medium(context, 16,color: AppColors.prime).copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.register);
              },
          ),
        ],
      ),
    );
  }
}
