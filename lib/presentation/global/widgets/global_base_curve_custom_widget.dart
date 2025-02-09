import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Widget personalizado con la parte superior redondeada hacia adentro.
class GlobalBaseCurveCustomWidget extends StatelessWidget {
  const GlobalBaseCurveCustomWidget(
      {super.key,
      required this.heightBase,
      required this.widthBase,
      required this.colorBase});

  // Dimesiones base.
  final double heightBase;
  final double widthBase;
  final Color colorBase;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withValues(alpha: 0),
      height: heightBase,
      width: widthBase,
      child: CustomPaint(
        painter: GlobalWidgetCurveCustom(color: colorBase),
      ),
    );
  }
}
