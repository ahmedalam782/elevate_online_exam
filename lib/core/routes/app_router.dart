import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/features/exam_score/presentation/view/pages/exam_score_page.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/pages/questions_page.dart';
import 'package:elevate_online_exam/features/exams_tap/presentation/view/pages/exams_tap_page.dart';
import 'package:elevate_online_exam/features/signup/presentation/view/pages/signup_page.dart';
import 'package:elevate_online_exam/features/login/presentation/view/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/app_layout/presentation/view/pages/app_layout_page.dart';
import '../../features/exams_tap/domain/entities/exams_entity.dart';
import '../../features/forget_password/presentation/view/pages/forget_password_page.dart';
import '../../features/splash/presentation/view/pages/splash_page.dart';
import '../../features/explore/domain/entities/subject_entities.dart';
import 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  navigatorKey: navigatorKey,
  routes: [
    _customAnimatedGoRoute(
      route: Routes.splash,
      page: (state, context) =>
          SplashPage(key: ValueKey(context.locale.languageCode.toString())),
    ),

    _customAnimatedGoRoute(
      route: Routes.register,
      page: (state, context) =>
          SignupPage(key: ValueKey(context.locale.languageCode.toString())),
    ),
    // TODO: Add more routes here
    _customAnimatedGoRoute(
      route: Routes.appLayout,
      page: (state, context) =>
          AppLayoutPage(key: ValueKey(context.locale.languageCode.toString())),
    ),

    _customAnimatedGoRoute(
      route: Routes.forgetPassword,
      page: (state, context) => ForgetPasswordPage(
        key: ValueKey(context.locale.languageCode.toString()),
      ),
    ),
    // login route
    // login route
    _customAnimatedGoRoute(
      route: Routes.login,
      page: (state, context) =>
          LoginPage(key: ValueKey(context.locale.languageCode.toString())),
    ),
    _customAnimatedGoRoute(
      route: Routes.questions,
      page: (state, context) {
        final data = state.extra as Map<String, dynamic>;
        return QuestionsPage(
          key: ValueKey(context.locale.languageCode.toString()),
          examEntity: data["exam"],
          subject: data["subject"],
        );
      },
    ),

    _customAnimatedGoRoute(
      route: Routes.examsTap,
      page: (state, context) {
        final subject = state.extra as SubjectEntities;
        return ExamsTapPage(
          key: ValueKey(context.locale.languageCode.toString()),
          subject: subject,
        );
      },
    ),
    _customAnimatedGoRoute(
      route: Routes.examScore,
      page: (state, context) {
        final exam = state.extra as ExamEntity;
        return ExamScorePage(exam: exam);
      },
    ),
  ],
);

GoRoute _customAnimatedGoRoute({
  required String route,
  required Widget Function(GoRouterState state, BuildContext context) page,
  Duration duration = const Duration(milliseconds: 450),
  Offset beginOffset = const Offset(1, 0),
  Offset endOffset = Offset.zero,
  Curve curve = Curves.easeInOut,
  List<GoRoute> routes = const [],
}) => GoRoute(
  path: route,
  routes: routes,
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: page(state, context),
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: endOffset,
        ).animate(CurvedAnimation(parent: animation, curve: curve)),
        child: child,
      );
    },
  ),
);

String getCurrentRoute(BuildContext context) {
  final location = GoRouterState.of(context).uri.toString();
  return location;
}
