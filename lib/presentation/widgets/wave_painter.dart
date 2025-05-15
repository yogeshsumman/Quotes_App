import 'dart:math';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double animationValue;
  final List<Color> colors;

  const WavePainter({
    required this.animationValue,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double waveBase = size.height * 0.65;
    final double waveTop = size.height * 0.55; // Reduced height difference
    final double amplitude = (waveBase - waveTop) / 2; // Smaller amplitude

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      final path = Path()..moveTo(0, waveBase);

      final double speed = 1 + i * 0.2; // Reduced speed for gentler motion
      for (double x = 0; x <= size.width; x += 20) {
        final y = waveTop +
            (waveBase - waveTop) / 2 +
            sin((x / size.width * 2 * pi) + (animationValue * 2 * pi * speed)) *
                amplitude;
        path.lineTo(x, y);
      }

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.colors != colors;
  }
}