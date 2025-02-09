import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';

/// Tema oscuro de la aplicación.
final appThemeDark = ThemeData.dark().copyWith(
    primaryColor: AppColors.firstDark,
    textTheme: _texTheme,
    elevatedButtonTheme: _elevationButton,
    inputDecorationTheme: _textField,
    appBarTheme: _appBar,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    switchTheme: _switchThemeData);

// Tema del Switch - Dark.
final _switchThemeData = SwitchThemeData(
  thumbColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      // Si el Switch está seleccionado
      if (states.contains(WidgetState.selected)) {
        return AppColors.fifthDark;
      }
      // En caso contrario
      return Colors.grey;
    },
  ),
  trackColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      // Aquí defines el color de la pista (la "barra de fondo")
      if (states.contains(WidgetState.selected)) {
        return AppColors.fifthDark
            .withValues(alpha: 0.5); // Color cuando está activado
      }
      return AppColors.sixthDark
          .withValues(alpha: 0.5); // Color cuando está desactivado
    },
  ),
);
// Tema del texto - Dark.
final _texTheme = TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Catamaran', color: AppColors.sixthDark));

// Tema del botón - Dark.
final _elevationButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondDark, // Se define el color del fondo.
    foregroundColor: AppColors.firstDark, // Se define el color del texto.
    shadowColor: AppColors.fourthDark,
    textStyle: TextStyle(
      fontFamily: 'Catamaran',
      fontWeight: FontWeight.w600,
    ),
  ),
);

// Tema del TextField - Dark.
final _textField = InputDecorationTheme(
    suffixStyle: TextStyle(
        fontFamily: 'Catamaran',
        color: AppColors.sixthDark.withValues(alpha: 0.6),
        fontWeight: FontWeight.w500),
    hintStyle: TextStyle(
        fontFamily: 'Catamaran',
        color: AppColors.sixthDark.withValues(alpha: 0.6),
        fontWeight: FontWeight.w300),
    labelStyle: TextStyle(
        fontFamily: 'Catamaran',
        color: AppColors.sixthDark.withValues(alpha: 0.6),
        fontWeight: FontWeight.w500));

// Tema del appBar - Dark.
final _appBar = AppBarTheme(
    backgroundColor: Colors.transparent, shadowColor: Colors.transparent);

// Tema del botón flotante - Dark
final _floatingActionButtonTheme =
    FloatingActionButtonThemeData(backgroundColor: AppColors.thirdDark);
