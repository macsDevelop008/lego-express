import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Vista de fondo global con color desenfocado global.
class GlobalBackgroundBlurredColorView extends StatelessWidget {
  const GlobalBackgroundBlurredColorView(
      {super.key, required this.height, required this.width});

  // Alto de la vista.
  final double height;
  // Ancho de la vista.
  final double width;

  @override
  Widget build(BuildContext context) {
    // Objeto con los coloes de la aplicación segun el tema.
    final appColors = AppColors(context: context);

    return Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Circulo decorativo central izquierdo.
            Positioned(
              top: height * 0.25,
              left: width * -0.5,
              child: GlobalBasicCircleColorWidget(
                size: width * 1.4,
                color: appColors.fourth.withValues(alpha: 0.4),
              ),
            ),
            // Circulo decorativo superior derecho.
            Positioned(
              top: height * -0.02,
              right: width * -0.15,
              child: GlobalBasicCircleColorWidget(
                size: width * .9,
                color: appColors.fifth.withValues(alpha: 0.4),
              ),
            ),
            // Circulo decorativo inferior derecho.
            Positioned(
              bottom: height * -0.02,
              right: width * -0.15,
              child: GlobalBasicCircleColorWidget(
                size: width * .9,
                color: appColors.fifth.withValues(alpha: 0.4),
              ),
            ),
            // Cuadro de desenfoque - efecto.
            GlobalBlurBoxWidget(
              width: width,
              height: height,
              color: Colors.transparent,
              blurX: 100,
              blurY: 100,
            ),
          ],
        ));
  }
}
