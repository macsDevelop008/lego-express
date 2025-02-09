import 'package:flutter/material.dart';

/// Clase que contiene los valores de las dimensiones de la pantalla
class ScreenResponsive {
  /// Obtiene el ancho de la pantalla.
  ///
  /// @param [context] Contexto de la aplicación.
  /// @param [percentaje] Porcentaje para calcular.
  /// @return Ancho de la pantalla según el porcentaje solicitado.
  static double width({
    required BuildContext context,
    double percentaje = 1,
  }) {
    return MediaQuery.of(context).size.width * percentaje;
  }

  /// Obtiene el alto de la pantalla.
  ///
  /// @param [context] Contexto de la aplicación.
  /// @param [percentaje] Porcentaje para calcular.
  /// @return Alto de la pantalla según el porcentaje solicitado.
  static double height({required BuildContext context, double percentaje = 1}) {
    return MediaQuery.of(context).size.height * percentaje;
  }
}
