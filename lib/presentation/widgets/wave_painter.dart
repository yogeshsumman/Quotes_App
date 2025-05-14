import 'dart:math';
import 'package:flutter/material.dart';

class WavePainter extends StatefulWidget {
  const WavePainter({super.key});

  @override
  _WavePainterState createState() => _WavePainterState();
}

class _WavePainterState extends State<WavePainter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WavePainter(_controller),
      size: Size.infinite,
    );
  }
}

class _WavePainter extends CustomPainter {
  final AnimationController controller;

  _WavePainter(this.controller) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      Colors.blue[900]!,
      Colors.teal[300]!,
      Colors.purple[200]!,
    ];

    for (int i = 0; i < 3; i++) {
      final paint = Paint()
        ..color = colors[i].withOpacity(0.7 - i * 0.2)
        ..style = PaintingStyle.fill;

      final path = Path();
      final waveTop = size.height * (i / 3.0);
      final waveBase = size.height * ((i + 1) / 3.0);
      final amplitude = 20.0 + i * 5.0; // Reduced for performance
      final speed = 0.4 + i * 0.1; // Slower for smoother animation

      path.moveTo(0, waveBase);
      path.lineTo(0, waveTop);

      for (double x = 0; x <= size.width; x += 20) { // Larger step for performance
        final y = waveTop +
            (waveBase - waveTop) / 2 +
            sin((x / size.width * 2 * pi) + (controller.value * 2 * pi * speed)) *
                amplitude;
        path.lineTo(x, y);
      }

      path.lineTo(size.width, waveBase);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}