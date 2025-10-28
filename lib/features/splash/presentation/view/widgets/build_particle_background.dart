import 'package:flutter/material.dart';

import 'particle_painter.dart';

class BuildParticleBackground extends StatelessWidget {
  final Animation<double> particleAnimation;
  const BuildParticleBackground({super.key, required this.particleAnimation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: particleAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(particleAnimation.value),
          size: Size.infinite,
        );
      },
    );
  }
}
