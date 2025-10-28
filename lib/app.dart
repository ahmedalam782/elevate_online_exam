import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/languages/lang.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_theme.dart';

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return _buildMaterialApp(context);
    }

    return Platform.isIOS
        ? CupertinoTheme(
            data: CupertinoThemeData(
              primaryColor: AppColors.primaryLight,
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(
                  fontFamily: context.locale.languageCode == 'ar'
                      ? LanguageHelper.arabicFontFamily
                      : LanguageHelper.englishFontFamily,
                ),
              ),
            ),
            child: _buildMaterialApp(context),
          )
        : _buildMaterialApp(context);
  }

  Widget _buildMaterialApp(BuildContext context) {
    return ScreenUtilInit(
      designSize: kIsWeb
          ? const Size(1440, 1024)
          : const Size(375, 812), // mobile size
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: AppTheme.lightTheme(context),
            darkTheme: AppTheme.darkTheme(context),
          ),
        );
      },
    );
  }
}
