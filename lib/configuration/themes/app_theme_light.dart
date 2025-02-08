import 'package:flutter/material.dart';
import 'package:logo_express/configuration/configuration.dart';

/// Tema claro de la aplicación.
final appThemeLight = ThemeData.light().copyWith(
    primaryColor: AppColors.firstLight,
    textTheme: _texTheme,
    elevatedButtonTheme: _elevationButton);

// Tema del texto - light.
final _texTheme = TextTheme(
    bodyMedium:
        TextStyle(fontFamily: 'Catamaran', color: AppColors.sixthLight));

// Tema del botón - light.
final _elevationButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondLight, // Se define el color del fondo.
    foregroundColor: AppColors.firstLight, // Se define el color del texto.
    shadowColor: AppColors.fourthLight,
    textStyle: TextStyle(fontFamily: 'Catamaran', fontWeight: FontWeight.w600),
  ),
);
