import 'package:flutter/material.dart';

/// Vista con el titulo de la pantalla del carrito.
class ShoppingCartTitleView extends StatelessWidget {
  const ShoppingCartTitleView(
      {super.key, required this.title, required this.titleSize});

  // Titulo
  final String title;
  // Tamaño titulo
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w700),
      ),
    );
  }
}
