import 'package:flutter/material.dart';
import 'package:logo_express/configuration/configuration.dart';
import 'package:logo_express/presentation/presentation.dart';

/// Pantalla de inicio de sesión.
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  /// Nombre y ruta de la pantalla.
  static const String name = 'log-in-screen';
  static const String route = '/$name';

  @override
  Widget build(BuildContext context) {
    // Tamaño de la pantalla.
    final double height = ScreenResponsive.height(context: context);
    final double width = ScreenResponsive.width(context: context);

    // Obtener el tema.
    final theme = Theme.of(context);

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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Espacio.
                  SizedBox(
                    height: height * 0.15,
                  ),
                  // Animación de compra.
                  GlobalShoppingAnimationView(
                    size: width * 0.6,
                  ),
                  // Eslogan y título de la app.
                  LogInTitleSloganView(
                    titleSize: width * 0.1,
                    sloganSize: width * 0.04,
                    height: height * 0.15,
                    width: width * 0.9,
                  ),
                ],
              ),
              // Formulario para inicio de sesión. Inputs y Botones.
              Positioned(
                bottom: 0,
                child: LogInFormButtonsView(
                  height: height * 0.4,
                  width: width,
                  appTheme: theme,
                ),
              )
            ],
          )),
    );
  }
}
