import 'package:flutter/material.dart';
import 'package:logo_express/configuration/configuration.dart';
import 'package:logo_express/presentation/presentation.dart';

/// Pantalla inicial.
class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  /// Nombre y ruta de la pantalla.
  static const String name = 'initial-screen';
  static const String route = '/$name';

  @override
  Widget build(BuildContext context) {
    // Tamaño de la pantalla.
    final double height = ScreenResponsive.height(context: context);
    final double width = ScreenResponsive.width(context: context);

    // Colores de la app según el tema.
    final appColors = AppColors(context: context);

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Fondo de la pantalla.
            GlobalBackgroundBlurredColorView(
              height: height,
              width: width,
            ),
            // Animación de compra.
            GlobalShoppingAnimationView(
              size: width * 0.8,
            ),
            // Indicador de carga en area segura.
            Positioned(
                bottom: height * 0.015,
                right: width * 0.05,
                child: SafeArea(
                    child: InitialFooterLoadingAnimationView(
                  sizeAnimation: width * 0.15,
                  color: appColors.fifth,
                  textSize: width * 0.05,
                  spaceSize: width * 0.05,
                ))),
          ],
        ),
      ),
    );
  }
}
