import 'package:flutter/material.dart';

class GlobalButtonImageWidget extends StatelessWidget {
  const GlobalButtonImageWidget(
      {super.key,
      required this.image,
      required this.event,
      this.roundedBorders,
      this.height,
      this.width,
      this.color,
      this.colorShadow});

  // Imagen del botón.
  final Widget image;
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
  // Color de la sombra.
  final Color? colorShadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: () {
            event();
          },
          style: ElevatedButton.styleFrom(
              shadowColor: colorShadow ?? Colors.transparent,
              backgroundColor: color,
              shape: roundedBorders != null
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(roundedBorders!))
                  : null),
          child: Align(alignment: Alignment.center, child: image)),
    );
  }
}
