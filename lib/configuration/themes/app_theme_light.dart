import 'package:flutter/material.dart';
import 'package:logo_express/configuration/configuration.dart';

/// Tema claro de la aplicación.
final appThemeLight = ThemeData.light().copyWith(textTheme: _texTheme);

// Tema del texto.
final _texTheme = TextTheme(
    bodyMedium:
        TextStyle(fontFamily: 'Catamaran', color: AppColors.sixthLight));
