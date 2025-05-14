import 'package:flutter/foundation.dart';
import '../data/quote_data.dart';
import '../models/quote.dart';

class QuoteController extends ChangeNotifier {
  static final QuoteController _instance = QuoteController._internal();
  factory QuoteController() => _instance;
  QuoteController._internal();

  List<Quote> get quotes => QuoteData.quotes;

  List<Quote> getFavorites() => quotes.where((quote) => quote.isFavorite).toList();

  void toggleFavorite(Quote quote) {
    quote.isFavorite = !quote.isFavorite;
    notifyListeners();
  }
}