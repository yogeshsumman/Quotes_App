import 'models/quote.dart';


class QuoteData {
  static List<Quote> quotes = [
    Quote(
      text: "The only way to do great work is to love what you do.",
      author: "Steve Jobs",
    ),
    Quote(
      text: "Life is what happens when you're busy making other plans.",
      author: "John Lennon",
    ),
    Quote(
      text: "Stay hungry, stay foolish.",
      author: "Steve Jobs",
    ),
     Quote(
      text: "Stay hungry, stay foolish.",
      author: "Steve Jobs",
    ),
     Quote(
      text: "Stay hungry, stay foolish.",
      author: "Steve Jobs",
    ),
     Quote(
      text: "Stay hungry, stay foolish.",
      author: "Steve Jobs",
    ),
     Quote(
      text: "Stay hungry, stay foolish.",
      author: "Steve Jobs",
    ),
     Quote(
      text: "Stay hungry, stay foolish.",
      author: "Steve Jobs",
    ),
     Quote(
      text: "Stay hungry, stay foolish.",
      author: "Steve Jobs",
    )
  
  ];

  static List<Quote> getFavorites() {
    return quotes.where((quote) => quote.isFavorite).toList();
  }

  static void toggleFavorite(Quote quote) {
    quote.isFavorite = !quote.isFavorite;
  }
}