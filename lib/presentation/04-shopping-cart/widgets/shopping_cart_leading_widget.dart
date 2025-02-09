import 'package:flutter/material.dart';

class ShoppingCartLeadingWidget extends StatelessWidget {
  const ShoppingCartLeadingWidget(
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
