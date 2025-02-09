import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Evento botón del appBar
void appBarLeadingEventHelper(BuildContext context) {
  // Dimensiones
  final widthItem = ScreenResponsive.width(context: context);
  final heightItem = ScreenResponsive.height(context: context);

  globalShowDialog(
      context: context,
      type: DialogType.info,
      body: ShoppingLogOutChangeThemeView(
        width: widthItem * 0.8,
        height: heightItem * 0.2,
      ));
}
