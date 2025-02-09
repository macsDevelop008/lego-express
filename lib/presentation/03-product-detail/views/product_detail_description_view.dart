import 'package:flutter/material.dart';

/// Visata con la descripción del producto.
class ProductDetailDescriptionView extends StatelessWidget {
  const ProductDetailDescriptionView(
      {super.key,
      required this.height,
      required this.width,
      required this.description,
      required this.descriptionSize});

  // Espacio a ocupar por la descripción
  final double height;
  final double width;
  // Texto
  final String description;
  // Texto taaño
  final double descriptionSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(right: width * 0.03),
      height: height,
      width: width,
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Text(
            description,
            style: TextStyle(
                fontSize: descriptionSize, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
