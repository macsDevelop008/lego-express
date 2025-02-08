import 'package:flutter/material.dart';

/// Widget global de círculo básico con color.
class GlobalBasicCircleColorWidget extends StatelessWidget {
  const GlobalBasicCircleColorWidget(
      {super.key, required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));
  }
}
