import 'package:flutter/material.dart';
import '../../models/quote.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  final int index;
  final VoidCallback onFavoriteTapped;
  final VoidCallback? navigateToFavorites; // Made optional

  const QuoteCard({
    super.key,
    required this.quote,
    required this.index,
    required this.onFavoriteTapped,
    this.navigateToFavorites, // Optional navigation callback
  });

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleFavoriteTap() {
    _controller.forward().then((_) {
      widget.onFavoriteTapped();
      // Removed automatic navigation to Favorites
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(-4, -4),
            blurRadius: 6,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(4, 4),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '"${widget.quote.text}"',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '- ${widget.quote.author}',
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: _handleFavoriteTap,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Icon(
                    widget.quote.isFavorite
                        ? Icons.favorite // Filled heart for favorited
                        : Icons.favorite_border, // Outlined heart for non-favorited
                    color: widget.quote.isFavorite ? Colors.red : Colors.grey,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}