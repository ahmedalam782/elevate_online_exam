import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedScoreIndicator extends StatelessWidget {
  final double correctRatio; // e.g. 0.8 = 80%
  final Duration duration;

  const AnimatedScoreIndicator({
    super.key,
    required this.correctRatio,
    this.duration = const Duration(seconds: 1),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: correctRatio.clamp(0.0, 1.0)),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        return CustomPaint(
          painter: _ScorePainter(value),
          size: const Size(150, 150),
          child: Center(
            child: Text(
              "${(value * 100).toStringAsFixed(0)}%",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ScorePainter extends CustomPainter {
  final double correctRatio;

  _ScorePainter(this.correctRatio);

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 8.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    const startAngle = math.pi / 1;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Paint setup
    final paintWrong = Paint()
      ..color = AppColors.errorDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final paintCorrect = Paint()
      ..color = AppColors.prime
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // 🔥 This controls the WHITE GAP between the red and blue arcs
    var gapAngle = 0.5; // ← increase this value to widen the gap (radians)
    if (correctRatio == 0 || correctRatio == 1) {
      gapAngle = 0;
    }
    // 0.15 ≈ 9 degrees | try 0.10 for smaller gap or 0.20 for larger gap

    final sweepWrong = 2 * math.pi * (1 - correctRatio) - gapAngle;
    final sweepCorrect = 2 * math.pi * correctRatio - gapAngle;

    if (sweepCorrect > 0) {
      canvas.drawArc(
        rect,
        startAngle + sweepWrong + gapAngle * 1.5,
        sweepCorrect,
        false,
        paintCorrect,
      );
    }
    // Draw red (wrong) arc
    if (sweepWrong > 0) {
      canvas.drawArc(
        rect,
        startAngle + gapAngle / 2,
        sweepWrong,
        false,
        paintWrong,
      );
    }

    // Draw blue (correct) arc
  }

  @override
  bool shouldRepaint(covariant _ScorePainter oldDelegate) =>
      oldDelegate.correctRatio != correctRatio;
}
