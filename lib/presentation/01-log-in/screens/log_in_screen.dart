import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Pantalla de inicio de sesión.
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  /// Nombre y ruta de la pantalla.
  static const String name = 'log-in-screen';
  static const String route = '/$name';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  // Dimensiones de la pantalla.
  late final double height;
  late final double width;

  @override
  void initState() {
    super.initState();

    // Calculo inicial (unico) de las dimensiones de la pantalla.
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    height = view.physicalSize.height / view.devicePixelRatio;
    width = view.physicalSize.width / view.devicePixelRatio;
  }

  @override
  Widget build(BuildContext context) {
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
              // Scroll para los TextField.
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                      // Formulario para inicio de sesión. Inputs y Botones.
                      LogInFormButtonsView(
                        height: height * 0.45,
                        width: width,
                        appTheme: theme,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
