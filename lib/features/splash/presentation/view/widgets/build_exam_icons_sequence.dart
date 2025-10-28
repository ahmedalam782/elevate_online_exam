import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/theme/app_colors.dart';

class BuildExamIconsSequence extends StatefulWidget {
  const BuildExamIconsSequence({
    super.key,
    required this.animation,
    required this.scaleAnimation,
    required this.opacityAnimation,
  });

  final Animation<double> animation;
  final Animation<double> scaleAnimation;
  final Animation<double> opacityAnimation;

  @override
  State<BuildExamIconsSequence> createState() => _BuildExamIconsSequenceState();
}

class _BuildExamIconsSequenceState extends State<BuildExamIconsSequence>
    with TickerProviderStateMixin {
  late AnimationController _sequenceController;
  late AnimationController _iconController;

  late Animation<double> _iconScaleAnimation;
  late Animation<double> _iconOpacityAnimation;

  final List<IconData> _examIcons = [
    Icons.school,
    Icons.edit,
    Icons.quiz,
    Icons.assignment,
    Icons.emoji_events,
  ];

  int _currentIconIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startIconSequence();
  }

  void _initializeAnimations() {
    _sequenceController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _iconController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _iconScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.elasticOut),
    );

    _iconOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _iconController, curve: Curves.easeIn));

    _sequenceController.repeat();
  }

  void _startIconSequence() {
    _iconController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) {
          _iconController.reverse().then((_) {
            if (mounted) {
              setState(() {
                _currentIconIndex = (_currentIconIndex + 1) % _examIcons.length;
              });
              _startIconSequence();
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _sequenceController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.scaleAnimation.value,
          child: Opacity(
            opacity: widget.opacityAnimation.value,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primeAccent.withValues(alpha: 0.3),
                    blurRadius: 15,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Lottie animation background
                  Center(
                    child: Lottie.asset(
                      'assets/animations/exam_icons_sequence.json',
                      controller: _sequenceController,
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.contain,
                      repeat: true,
                      animate: true,
                    ),
                  ),
                  // Animated icon sequence
                  Center(
                    child: AnimatedBuilder(
                      animation: _iconController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _iconScaleAnimation.value,
                          child: Opacity(
                            opacity: _iconOpacityAnimation.value,
                            child: Icon(
                              _examIcons[_currentIconIndex],
                              size: 35.sp,
                              color: AppColors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
