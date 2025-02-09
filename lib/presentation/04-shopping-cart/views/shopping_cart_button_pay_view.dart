import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingCartButtonPayView extends StatelessWidget {
  const ShoppingCartButtonPayView(
      {super.key,
      required this.height,
      required this.width,
      required this.appTheme});

  // Dimensiones
  final double height;
  final double width;
  // Tema de la app
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
    return GlobalButtonTextWidget(
        text: 'Ir a Pagar',
        sizeText: height * 0.05,
        height: height * 0.15,
        event: () {});
  }
}
