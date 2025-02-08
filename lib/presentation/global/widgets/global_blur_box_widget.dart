import 'dart:ui';

import 'package:flutter/material.dart';

/// Widget global de cuadro de desenfoque. Desenfoca lo que hay debajo de él.
class GlobalBlurBoxWidget extends StatelessWidget {
  const GlobalBlurBoxWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.blurX,
      required this.blurY});

  // Ancho del cuadro.
  final double width;
  // Alto del cuadro.
  final double height;
  // Color del cuadro.
  final Color color;
  // Desenfoque horizontal.
  final double blurX;
  // Desenfoque vertical.
  final double blurY;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
