import 'package:flutter/material.dart';
// import '../data/models/quote.dart';
import '../widgets/quote_card.dart';
import '../data/quote_data.dart';
import '../widgets/wave_painter.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteQuotes = QuoteData.getFavorites();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Quotes')),
      body: Stack(
        children: [
          // Wave background
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: WavePainter(),
            ),
          ),
          //------->>>>>>>>>>>>> Favorite quotes list or empty message<<<<<<<<<<------------
          favoriteQuotes.isEmpty
              ? const Center(child: Text('No favorite quotes yet!'))
              : ListView.builder(
                  itemCount: favoriteQuotes.length,
                  itemBuilder: (context, index) {
                    final quote = favoriteQuotes[index];
                    return QuoteCard(
                      quote: quote,
                      onFavoriteTapped: () {
                        setState(() {
                          QuoteData.toggleFavorite(quote);
                        });
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}