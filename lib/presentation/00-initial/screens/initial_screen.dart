import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Pantalla inicial.
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  /// Nombre y ruta de la pantalla.
  static const String name = 'initial-screen';
  static const String route = '/$name';

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();

    // Ejecutar despues del build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Inicializa data
      await initialDataHelper(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tamaño de la pantalla.
    final double height = ScreenResponsive.height(context: context);
    final double width = ScreenResponsive.width(context: context);

    // Colores de la app según el tema.
    final appColors = AppColors(context: context);

    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (d, r) {
          debugPrint('Botón nativo capturado.');
        },
        child: SizedBox(
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
      ),
    );
  }
}
