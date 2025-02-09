import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Cierra dialog
void closeDialog({required BuildContext context}) {
  context.pop();
}

/// Muestra el dialog correspondiente según los parámetros.
void globalShowDialog({
  required BuildContext context,
  required DialogType type,
  bool dismissOnTouchOutside = true,
  String? title,
  String? description,
  Widget? body,
  VoidCallback? onPressOk,
  VoidCallback? onPressCancel,
}) {
  // Tema de la app
  final appTheme = Theme.of(context);
  final String familyText = 'Catamaran';
  final Color? colorText = appTheme.textTheme.bodyMedium?.color;

  // Dialog
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    title: title,
    desc: description,
    body: body,
    btnOkOnPress: onPressOk,
    btnCancelOnPress: onPressCancel,
    dismissOnTouchOutside: dismissOnTouchOutside,
    dialogBackgroundColor: appTheme.primaryColor,
    dialogType: type,
    titleTextStyle: TextStyle(
        fontFamily: familyText, color: colorText, fontWeight: FontWeight.w700),
    descTextStyle: TextStyle(
        fontFamily: familyText, color: colorText, fontWeight: FontWeight.w400),
  ).show();
}
