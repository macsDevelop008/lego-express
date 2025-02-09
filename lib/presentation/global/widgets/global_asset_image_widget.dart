import 'package:flutter/material.dart';

class GlobalAssetImageWidget extends StatelessWidget {
  const GlobalAssetImageWidget(
      {super.key, required this.size, required this.urlAssetImage});

  // Tamaño redimension.
  final double size;
  // Url de la imagen.
  final String urlAssetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withValues(alpha: 0),
      height: size,
      width: size,
      child: Image.asset(
        urlAssetImage,
        fit: BoxFit.contain,
      ),
    );
  }
}
