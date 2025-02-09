import 'package:flutter/material.dart';

/// Widget con el botón lateral izquierdo del appBar.
class ProductDetailLeadingWidget extends StatelessWidget {
  const ProductDetailLeadingWidget(
      {super.key,
      required this.paddingLeft,
      required this.event,
      required this.color});

  // Espacio a la izquierda.
  final double paddingLeft;
  // Evento del botón.
  final VoidCallback event;
  // Color del icono del boton.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: IconButton(
          onPressed: () {
            event();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: color,
          )),
    );
  }
}
