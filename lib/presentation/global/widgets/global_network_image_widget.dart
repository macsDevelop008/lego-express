import 'package:flutter/material.dart';

/// Widget para mostrar una imagen segpun la url web con reescalado.
class GlobalNetworkImageWidget extends StatelessWidget {
  const GlobalNetworkImageWidget(
      {super.key, required this.size, required this.urlImage});

  // Tamaño redimension.
  final double size;
  // Url de la imagen.
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withValues(alpha: 0),
      height: size,
      width: size,
      child: Image.network(
        urlImage,
        fit: BoxFit.contain,
      ),
    );
  }
}
