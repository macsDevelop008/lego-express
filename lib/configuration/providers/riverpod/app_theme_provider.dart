import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logo_express/configuration/configuration.dart';

/// Provider del tema de la aplicación.
///
/// @return el tema de la aplicación actual.
final appThemeProvider = StateProvider<ThemeData>((ref) {
  return appThemeLight;
});
