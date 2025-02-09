import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/configuration/enums/dialog_type_enum.dart';
import 'package:lego_express/configuration/statics/responsive/screen_responsive.dart';

/// Función para mostrar un diálogo personalizado con animación de rebote.
/// Los botones "Aceptar" y "Cancelar" se muestran solo si se pasan sus respectivos callbacks.
Future showCustomDialog({
  required BuildContext context,
  required DialogType type,
  required Widget body,
  VoidCallback? onPressOk,
  VoidCallback? onPressCancel,
  bool barrierDismissible = false,
}) {
  double minHeight = 0;
  double fixedWidth = ScreenResponsive.width(context: context, percentaje: 0.8);
  return showGeneralDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Center(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: fixedWidth,
              minHeight: minHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Parte superior: Ícono o imagen.
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      _getIcon(type),
                      size: fixedWidth * 0.25,
                    ),
                  ),
                  // Parte central: Cuerpo del diálogo.
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: body,
                    ),
                  ),
                  // Parte inferior: Botones "Aceptar" y "Cancelar".
                  if (onPressOk != null || onPressCancel != null)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (onPressCancel != null)
                            OutlinedButton(
                              onPressed: () {
                                onPressCancel();
                              },
                              child: const Text('Cancelar'),
                            ),
                          if (onPressCancel != null && onPressOk != null)
                            const SizedBox(width: 8),
                          if (onPressOk != null)
                            ElevatedButton(
                              onPressed: () {
                                onPressOk();
                              },
                              child: const Text('Aceptar'),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      // Aplicamos una transición de escala con curvas de rebote.
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.bounceOut,
          reverseCurve: Curves.easeInExpo,
        ),
        child: child,
      );
    },
  );
}

IconData _getIcon(DialogType type) {
  switch (type) {
    case DialogType.alert:
      return Icons.info_rounded;

    case DialogType.error:
      return Icons.error;
    case DialogType.success:
      return Icons.check_rounded;
  }
}

Future closeDialog(BuildContext context) async {
  GoRouter.of(context).pop();
}
