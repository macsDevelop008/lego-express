import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// Widget de animación de carga global.
class GlobalAnimationLoadingWidget extends StatelessWidget {
  const GlobalAnimationLoadingWidget(
      {super.key, required this.size, required this.color});

  // Tamaño de la animación.
  final double size;
  // Color de la animación.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fourRotatingDots(
      color: color,
      size: size,
    );
  }
}
