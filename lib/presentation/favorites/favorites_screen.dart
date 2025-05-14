import 'package:flutter/material.dart';
import 'favorites_body.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Favorite Quotes')),
      body: FavoritesBody(),
    );
  }
}