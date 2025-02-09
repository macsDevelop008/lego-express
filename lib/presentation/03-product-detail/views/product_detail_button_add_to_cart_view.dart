import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

class ProductDetailButtonAddToCartView extends StatelessWidget {
  const ProductDetailButtonAddToCartView(
      {super.key, required this.height, required this.width});

  // Espacio a ocupar por la descripción
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.yellow.withValues(alpha: 0),
      height: height,
      width: width,
      child: GlobalButtonTextWidget(
          width: width,
          height: height * 0.6,
          text: 'Agregar al Carrito',
          sizeText: height * 0.2,
          roundedBorders: height * 0.2,
          event: () {}),
    );
  }
}
