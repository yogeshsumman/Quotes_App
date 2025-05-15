import 'package:flutter/material.dart';
import '../../controllers/quote_controller.dart';
import '../widgets/quote_list.dart';
import '../widgets/wave_background.dart';

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
        WaveBackground(
          waveColors: const [
            Color(0xFFB3E5FC), // Light blue (equivalent to Colors.lightBlue[100])
            Color(0xFF81D4FA), // Light blue (equivalent to Colors.lightBlue[200])
            Color(0xFF4FC3F7), // Light blue (equivalent to Colors.lightBlue[300])
          ],
          enableAnimation: enableWaveAnimation,
        ),
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