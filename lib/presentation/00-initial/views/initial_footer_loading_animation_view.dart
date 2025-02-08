import 'package:flutter/material.dart';
import 'package:logo_express/presentation/presentation.dart';

class InitialFooterLoadingAnimationView extends StatelessWidget {
  const InitialFooterLoadingAnimationView(
      {super.key,
      required this.sizeAnimation,
      required this.color,
      required this.textSize,
      required this.spaceSize});

  // Tamaño de la animación.
  final double sizeAnimation;
  // Tamaño del texto.
  final double textSize;
  // Tamaño del espacio.
  final double spaceSize;
  // Color de la animación.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Cargando...',
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.w200,
          ),
        ),
        // Espacio.
        SizedBox(width: textSize),
        // Animación de carga.
        GlobalAnimationLoadingWidget(
          size: sizeAnimation,
          color: color,
        ),
      ],
    );
  }
}
