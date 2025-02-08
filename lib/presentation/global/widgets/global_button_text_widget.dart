import 'package:flutter/material.dart';

/// Widget botón con texto centrado.
class GlobalButtonTextWidget extends StatelessWidget {
  const GlobalButtonTextWidget(
      {super.key,
      required this.text,
      required this.sizeText,
      this.color,
      this.colorText,
      this.height,
      this.width,
      this.roundedBorders,
      required this.event});

  // Texto del botón.
  final String text;
  // Tamaño del texto.
  final double sizeText;
  // Evento del botón.
  final VoidCallback event;
  // Bordes redondeados.
  final double? roundedBorders;
  // Alto.
  final double? height;
  // Ancho.
  final double? width;
  // Color del botón.
  final Color? color;
  // Color del texto.
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          event();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: roundedBorders != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(roundedBorders!))
                : null),
        child: SizedBox(
          height: height,
          width: width,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontSize: sizeText, color: colorText),
            ),
          ),
        ));
  }
}
