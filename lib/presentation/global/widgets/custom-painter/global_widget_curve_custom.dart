import 'package:flutter/material.dart';

// Widget-Custom dibuja cuadrado con una curva.
class GlobalWidgetCurveCustom extends CustomPainter {
  GlobalWidgetCurveCustom({super.repaint, required this.color});

  // Color base.
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    // Lapiz
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    // Lienzo
    final path = Path();

    final x = size.width;
    final y = size.height;

    // Dibujado por coodernadas.
    path.moveTo(0, 0);
    path.quadraticBezierTo(x * 0.5, y * 0.35, x, 0);
    path.lineTo(x, y);
    path.lineTo(0, y);
    path.lineTo(0, 0);

    // Dibujado
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
