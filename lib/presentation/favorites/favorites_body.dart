import 'package:flutter/material.dart';
import '../../controllers/quote_controller.dart';
import '../widgets/quote_list.dart';
import '../widgets/wave_painter.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const WavePainter(),
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