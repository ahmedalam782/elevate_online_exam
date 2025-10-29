import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:elevate_online_exam/core/languages/lang.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_app_bar.dart';
import 'package:elevate_online_exam/features/login/presentation/view/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == arabicLocale.languageCode;
    context.setLocale(englishLocale);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          title: LocaleKeys.login_log_in.tr(),
          isCenteredTitle: false,
        ),
        body: LoginBody(),
      ),
    );
  }
}
