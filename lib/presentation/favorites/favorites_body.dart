import 'package:flutter/material.dart';
import '../../controllers/quote_controller.dart';
import '../widgets/quote_list.dart';
import '../widgets/wave_background.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const WaveBackground(
          waveColors: [
            Color(0xFFFFF9C4), // Light yellow (equivalent to Colors.yellow[100])
            Color(0xFFFFE082), // Light amber (equivalent to Colors.amber[100])
            Color(0xFFFFCC80), // Light orange (equivalent to Colors.orange[100])
          ],
        ),
        ListenableBuilder(
          listenable: QuoteController(),
          builder: (context, child) {
            final controller = QuoteController();
            final favoriteQuotes = controller.getFavorites();
            return favoriteQuotes.isEmpty
                ? const Center(child: Text('No favorite quotes yet!'))
                : QuoteList(
                    quotes: favoriteQuotes,
                    onFavoriteTapped: (quote) => controller.toggleFavorite(quote),
                  );
          },
        ),
      ],
    );
  }
}