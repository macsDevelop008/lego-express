import 'package:flutter/material.dart';

/// Widget con texto e imagen en horizontal.
class ShoppingTextImageWidget extends StatelessWidget {
  const ShoppingTextImageWidget(
      {super.key,
      required this.textSize,
      required this.imageSize,
      required this.routeImage,
      required this.maxSizeHorizontal,
      required this.text});

  // Tamaño del text.
  final double textSize;
  // Texto.
  final String text;
  // Tamaño de la imagen.
  final double imageSize;
  // Ruta de la imagen.
  final String routeImage;
  // Tamaño maximo en horizontal.
  final double maxSizeHorizontal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.green.withValues(alpha: 0),
          constraints: BoxConstraints(maxWidth: maxSizeHorizontal),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: textSize),
          ),
        ),
        Transform.scale(
          scale: imageSize,
          child: Image.asset(routeImage),
        )
      ],
    );
  }
}
