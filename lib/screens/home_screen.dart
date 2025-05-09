import 'package:flutter/material.dart';
// import '../data/models/quote.dart';
import '../widgets/quote_card.dart';
import '../data/quote_data.dart';
import '../widgets/wave_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Quotes')),
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
          // Quote list
          ListView.builder(
            itemCount: QuoteData.quotes.length,
            itemBuilder: (context, index) {
              final quote = QuoteData.quotes[index];
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