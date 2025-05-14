import 'package:flutter/material.dart';
import '../../models/quote.dart';
import 'quote_card.dart';

class QuoteList extends StatelessWidget {
  final List<Quote> quotes;
  final Function(Quote) onFavoriteTapped;
  final VoidCallback? navigateToFavorites; // Made optional

  const QuoteList({
    super.key,
    required this.quotes,
    required this.onFavoriteTapped,
    this.navigateToFavorites, // Optional navigation callback
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return QuoteCard(
          key: ValueKey(quote.text),
          quote: quote,
          index: index,
          onFavoriteTapped: () => onFavoriteTapped(quote),
          navigateToFavorites: navigateToFavorites,
        );
      },
      physics: const BouncingScrollPhysics(),
      cacheExtent: 1000.0,
    );
  }
}