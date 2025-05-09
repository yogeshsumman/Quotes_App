import 'package:flutter/material.dart';
import '../data/models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback onFavoriteTapped;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.onFavoriteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '"${quote.text}"',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '- ${quote.author}',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  quote.isFavorite ? Icons.thumb_up : Icons.thumb_up_off_alt,
                  color: quote.isFavorite ? Colors.blue : null,
                ),
                onPressed: onFavoriteTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}