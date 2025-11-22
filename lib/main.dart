import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/features/questions/data/models/adapters/questions_adapters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/config/di/injectable_config.dart';
import 'core/helper/bloc/bloc_observer.dart';
import 'core/languages/lang.dart';
import 'core/routes/url_strategy.dart';

const bool runLocal = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(
    EasyLocalization(
      supportedLocales: [arabicLocale, englishLocale],
      fallbackLocale: arabicLocale,
      startLocale: englishLocale,
      path: assetsLocalization,
      child: const OnlineExam(),
    ),
  );
  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();
  // Set custom Bloc observer for debugging
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  //==================FOR WEB=====================
  GoRouter.optionURLReflectsImperativeAPIs = true;
  setPathUrlStrategy();
}

Future<void> initHive() async {
  Hive
    ..registerAdapter(QuestionsResponseAdapter())
    ..registerAdapter(QuestionDtoAdapter())
    ..registerAdapter(AnswerDtoAdapter())
    ..registerAdapter(ExamDtoAdapter());

  await Hive.initFlutter();
}
