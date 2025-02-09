import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Evento botón del appBar
void appBarLeadingEventHelper(BuildContext context) {
  // Dimensiones
  final widthItem = ScreenResponsive.width(context: context);
  final heightItem = ScreenResponsive.height(context: context);

  showCustomDialog(
      context: context,
      type: DialogType.alert,
      barrierDismissible: true,
      body: ShoppingLogOutChangeThemeView(
        width: widthItem * 0.8,
        height: heightItem * 0.2,
      ));
}
