import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';

/// AppTheme Clase que contiene los temas de la aplicación.
class AppColors {
  AppColors({required this.context});

  final BuildContext context;
/*
  /// Colores para el tema claro.
  static const firstLight = Color.fromRGBO(255, 255, 255, 1);
  static const secondLight = Color.fromRGBO(68, 92, 236, 1);
  static const thirdLight = Color.fromRGBO(243, 21, 101, 1);
  static const fourthLight = Color.fromRGBO(158, 153, 237, 1);
  static const fifthLight = Color.fromRGBO(237, 192, 216, 1);
  static const sixthLight = Color.fromRGBO(46, 55, 101, 1);
*/
  /// Fondo o color base (ligeramente apagado para no ser tan puro blanco)
  static const firstLight = Color.fromRGBO(240, 240, 240, 1);

  /// Azul fuerte, ideal para acentos y botones
  static const secondLight = Color.fromRGBO(21, 101, 192, 1);

  /// Rojo vibrante, para destacar elementos importantes
  static const thirdLight = Color.fromRGBO(229, 57, 53, 1);

  /// Amarillo brillante, para dar energía y llamar la atención
  static const fourthLight = Color.fromRGBO(253, 216, 53, 1);

  /// Verde intenso, ideal para detalles o mensajes de éxito
  static const fifthLight = Color.fromRGBO(67, 160, 71, 1);

  /// Gris oscuro, útil para textos y acentos contrastantes
  static const sixthLight = Color.fromRGBO(33, 33, 33, 1);

  /// Colores para el tema oscuro.
  /// Fondo principal oscuro (para pantallas y contenedores generales).
  static const firstDark = Color.fromRGBO(20, 20, 20, 1);

  /// Azul de acento, versión más clara para resaltar sobre el fondo oscuro.
  static const secondDark = Color.fromRGBO(100, 181, 246, 1);

  /// Rojo vibrante, adaptado para contrastar en el modo oscuro.
  static const thirdDark = Color.fromRGBO(239, 83, 80, 1);

  /// Amarillo brillante, que se destaca sobre el fondo oscuro.
  static const fourthDark = Color.fromRGBO(255, 238, 88, 1);

  /// Verde intenso, versión clara para el modo oscuro.
  static const fifthDark = Color.fromRGBO(129, 199, 132, 1);

  /// Gris claro, ideal para textos o detalles que requieran contraste sobre el fondo oscuro.
  static const sixthDark = Color.fromRGBO(189, 189, 189, 1);

  /// Colores para el tema actual.
  Color get first {
    return _currenTheme == AppThemeEnum.light ? firstLight : firstDark;
  }

  Color get second {
    return _currenTheme == AppThemeEnum.light ? secondLight : secondDark;
  }

  Color get third {
    return _currenTheme == AppThemeEnum.light ? thirdLight : thirdDark;
  }

  Color get fourth {
    return _currenTheme == AppThemeEnum.light ? fourthLight : fourthDark;
  }

  Color get fifth {
    return _currenTheme == AppThemeEnum.light ? fifthLight : fifthDark;
  }

  Color get sixth {
    return _currenTheme == AppThemeEnum.light ? sixthLight : sixthDark;
  }

  /// Tema actual en enumerado.
  ///
  /// @return Enumerado que representa el tema actual.
  AppThemeEnum get _currenTheme {
    // Obtiene el tema actual del provider.
    final ref = ProviderScope.containerOf(context);
    final appTheme = ref.read(appThemeProvider);

    // Si es tema oscuro.
    if (appTheme == appThemeDark) {
      return AppThemeEnum.dark;
    } else {
      // Si es tema claro.
      return AppThemeEnum.light;
    }
  }
}
