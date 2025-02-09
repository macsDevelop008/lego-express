import 'package:flutter/material.dart';

/// Widget con boton flotante.
class ShoppingFloatingActionButton extends StatelessWidget {
  const ShoppingFloatingActionButton(
      {super.key,
      required this.event,
      required this.icon,
      required this.iconColor});

  // Evento.
  final VoidCallback event;
  // Icono.
  final IconData icon;
  // Color del icono del botón.
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        event();
      },
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
