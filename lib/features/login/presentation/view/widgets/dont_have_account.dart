import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
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
        children: [
          TextSpan(
            text: LocaleKeys.login_sign_up.tr(),
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.prime,
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
