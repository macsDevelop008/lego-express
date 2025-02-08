import 'package:flutter/material.dart';

/// Widget para el texto alineado.
class LogInFormTitleTextWidget extends StatelessWidget {
  const LogInFormTitleTextWidget(
      {super.key,
      required this.text,
      required this.textSize,
      required this.paddinfLeft,
      required this.color});

  // Texto
  final String text;
  // Tamaño del texto
  final double textSize;
  // Color del tecto.
  final Color color;
  // Padding izquierdo.
  final double paddinfLeft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddinfLeft),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: textSize, fontWeight: FontWeight.w600, color: color),
        ),
      ),
    );
  }
}
