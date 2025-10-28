import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    // Create floating particles
    for (int i = 0; i < 20; i++) {
      final x = (size.width * (i * 0.1 + animationValue)) % size.width;
      final y =
          size.height * 0.2 +
          (size.height * 0.6 * (i * 0.05 + animationValue)) %
              (size.height * 0.6);

      canvas.drawCircle(Offset(x, y), 2 + (i % 3).toDouble(), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
