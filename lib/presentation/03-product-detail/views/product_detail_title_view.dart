import 'package:flutter/material.dart';

/// Vista con el titulo del producto.
class ProductDetailTitleView extends StatelessWidget {
  const ProductDetailTitleView(
      {super.key, required this.title, required this.size});

  // Titulo o nombre.
  final String title;
  // Tamaño del titulo.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: size, fontWeight: FontWeight.w800),
      ),
    );
  }
}
