import 'package:flutter/material.dart';
import 'package:logo_express/configuration/configuration.dart';

/// Widget que muestra el logo de la aplicación con un fondo de color circular.
class GlobalLogoAplicationCircularView extends StatelessWidget {
  const GlobalLogoAplicationCircularView({super.key});

  @override
  Widget build(BuildContext context) {
    // Tamaño del círculo.
    final sizeCircle =
        ScreenResponsive.width(context: context, percentaje: 0.5);
    // Color del fondo.

    return Container(
      alignment: Alignment.center,
      height: sizeCircle,
      width: sizeCircle,
      padding: EdgeInsets.all(sizeCircle * 0.23),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
