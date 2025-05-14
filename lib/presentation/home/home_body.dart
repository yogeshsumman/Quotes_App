import 'package:flutter/material.dart';
import '../../controllers/quote_controller.dart';
import '../widgets/quote_list.dart';
import '../widgets/wave_painter.dart';

class HomeBody extends StatelessWidget {
  final bool enableWaveAnimation;

  const HomeBody({
    super.key,
    this.enableWaveAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (enableWaveAnimation) const WavePainter(),
        ListenableBuilder(
          listenable: QuoteController(),
          builder: (context, child) {
            final controller = QuoteController();
            return QuoteList(
              quotes: controller.quotes,
              onFavoriteTapped: (quote) => controller.toggleFavorite(quote),
            );
          },
        ),
      ],
    );
  }
}