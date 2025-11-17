import 'dart:async';
import 'package:elevate_online_exam/core/config/api/end_points.dart';
import 'package:elevate_online_exam/core/config/di/injectable_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/routes/routes.dart';
import '../widgets/splash_body.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _progressController;
  late AnimationController _particleController;

  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<double> _textSlideAnimation;
  late Animation<double> _progressAnimation;
  late Animation<double> _particleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
    _navigateToNextScreen();
  }

  void _initializeAnimations() {
    // Logo animations (faster)
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    // Text animations (faster)
    _textController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _textOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _textSlideAnimation = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    // Progress animation (faster)
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    // Particle animation (faster)
    _particleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _particleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _particleController, curve: Curves.linear),
    );
  }

  void _startAnimations() {
    // Start logo animation
    _logoController.forward();

    // Start text animation after a shorter delay
    Timer(const Duration(milliseconds: 400), () {
      _textController.forward();
    });

    // Start progress animation
    Timer(const Duration(milliseconds: 600), () {
      _progressController.forward();
    });

    // Start particle animation
    _particleController.repeat();
  }

void _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 1800));
    final scc = getIt<FlutterSecureStorage>();
    final sharedPreferences = getIt<SharedPreferences>();
    final token = await scc.read(key: Apikeys.accessToken);
    final isRemeberMe = sharedPreferences.getBool(Apikeys.rememberMe) ?? false;
    if (!mounted) return;
    if (token == null) {
      context.go(Routes.login);
    } else if (isRemeberMe) {
      context.go(Routes.appLayout);
    } else {
      context.go(Routes.login);
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _progressController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBody(
        logoController: _logoController,
        textController: _textController,
        progressController: _progressController,
        particleController: _particleController,
        logoScaleAnimation: _logoScaleAnimation,
        logoOpacityAnimation: _logoOpacityAnimation,
        textOpacityAnimation: _textOpacityAnimation,
        textSlideAnimation: _textSlideAnimation,
        progressAnimation: _progressAnimation,
        particleAnimation: _particleAnimation,
      ),
    );
  }
}
