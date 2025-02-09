import 'package:flutter/material.dart';

/// Botón para ir a la opciones del usuario.
class ShoppingImageUserWidget extends StatelessWidget {
  const ShoppingImageUserWidget(
      {super.key, required this.size, required this.color});

  // Tamaño del widget.
  final double size;
  // Color base del Widget.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: size * 0.4),
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
      child: Icon(
        Icons.people,
        color: color,
      ),
    );
  }
}
