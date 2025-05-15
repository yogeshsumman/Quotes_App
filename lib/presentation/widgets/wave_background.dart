import 'package:flutter/material.dart';
import 'wave_painter.dart';

class WaveBackground extends StatefulWidget {
  final List<Color> waveColors;
  final bool enableAnimation;

  const WaveBackground({
    super.key,
    required this.waveColors,
    this.enableAnimation = true,
  });

  @override
  State<WaveBackground> createState() => _WaveBackgroundState();
}

class _WaveBackgroundState extends State<WaveBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8), // Increased duration for slower animation
      vsync: this,
    );
    if (widget.enableAnimation) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(WaveBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enableAnimation != oldWidget.enableAnimation) {
      if (widget.enableAnimation) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: WavePainter(
            animationValue: _controller.value,
            colors: widget.waveColors,
          ),
        );
      },
    );
  }
}