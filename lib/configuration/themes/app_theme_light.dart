import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';

/// Tema claro de la aplicación.
final appThemeLight = ThemeData.light().copyWith(
    primaryColor: AppColors.firstLight,
    textTheme: _texTheme,
    elevatedButtonTheme: _elevationButton,
    inputDecorationTheme: _textField,
    appBarTheme: _appBar,
    floatingActionButtonTheme: _floatingActionButtonTheme);

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
    textStyle: TextStyle(
      fontFamily: 'Catamaran',
      fontWeight: FontWeight.w600,
    ),
  ),
);

// Tema del TextField - light.
final _textField = InputDecorationTheme(
    suffixStyle: TextStyle(
        fontFamily: 'Catamaran',
        color: AppColors.sixthLight.withValues(alpha: 0.6),
        fontWeight: FontWeight.w500),
    hintStyle: TextStyle(
        fontFamily: 'Catamaran',
        color: AppColors.sixthLight.withValues(alpha: 0.6),
        fontWeight: FontWeight.w300),
    labelStyle: TextStyle(
        fontFamily: 'Catamaran',
        color: AppColors.sixthLight.withValues(alpha: 0.6),
        fontWeight: FontWeight.w500));

// Tema del appBar - light.
final _appBar = AppBarTheme(
    backgroundColor: Colors.transparent, shadowColor: Colors.transparent);

// Tema del botón flotante - light
final _floatingActionButtonTheme =
    FloatingActionButtonThemeData(backgroundColor: AppColors.thirdLight);
