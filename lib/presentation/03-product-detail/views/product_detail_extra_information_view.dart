import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Vista con información extra de producto.
class ProductDetailExtraInformationView extends StatelessWidget {
  const ProductDetailExtraInformationView(
      {super.key,
      required this.iconCalificationSize,
      required this.textCalification,
      required this.sizeTextCalification});

  // Tamaño del icono/imagen de la calificación
  final double iconCalificationSize;
  // Texto calificación
  final String textCalification;
  // Texto calificación tamaño
  final double sizeTextCalification;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Imagen - Calificación
            GlobalAssetImageWidget(
                size: iconCalificationSize,
                urlAssetImage: 'assets/images/icons/star.png'),
            // Texto - Calificación
            Text(
              textCalification,
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: sizeTextCalification),
            )
          ],
        ));
  }
}
