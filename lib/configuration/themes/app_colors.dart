import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logo_express/configuration/configuration.dart';

/// AppTheme Clase que contiene los temas de la aplicación.
class AppColors {
  AppColors({required this.context});

  final BuildContext context;

  /// Colores para el tema claro.
  static const firstLight = Color.fromRGBO(255, 255, 255, 1);
  static const secondLight = Color.fromRGBO(68, 92, 236, 1);
  static const thirdLight = Color.fromRGBO(243, 21, 101, 1);
  static const fourthLight = Color.fromRGBO(158, 153, 237, 1);
  static const fifthLight = Color.fromRGBO(237, 192, 216, 1);
  static const sixthLight = Color.fromRGBO(46, 55, 101, 1);

  /// Colores para el tema oscuro.
  static const firstDark = Color.fromRGBO(18, 18, 18, 1);
  static const secondDark = Color.fromRGBO(84, 110, 255, 1);
  static const thirdDark = Color.fromRGBO(255, 64, 140, 1);
  static const fourthDark = Color.fromRGBO(190, 185, 255, 1);
  static const fifthDark = Color.fromRGBO(255, 225, 235, 1);
  static const sixthDark = Color.fromRGBO(70, 80, 140, 1);

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
