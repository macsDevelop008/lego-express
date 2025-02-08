import 'package:flutter/material.dart';
import 'package:logo_express/presentation/presentation.dart';

/// Vista de los Inputs y botones del formulario de inicio de sesión.
class LogInFormButtonsView extends StatelessWidget {
  const LogInFormButtonsView({
    super.key,
    required this.height,
    required this.width,
    required this.appTheme,
  });

  // Alto del espacio a ocupar.
  final double height;
  // Ancho del espacio a ocupar.
  final double width;
  // Tema de la aplicación.
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
    return
        // Base o Background.
        Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: appTheme.primaryColor.withValues(alpha: 0.7),
          borderRadius: _borderRadius()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          GlobalTextFieldWidget(
            width: width * 0.85,
            height: height * 0.2,
            // Color basado en el color del backgroun del botón.
            backgroundColor: appTheme
                .elevatedButtonTheme.style!.backgroundColor!
                .resolve(<WidgetState>{})!.withValues(alpha: 0.13),
            borderRadiusValue: width * 0.04,
          ),
        ],
      ),
    );
  }

  /// Calcula el borde redondeado de la base o Background.
  ///
  /// @return El BorderRadius para aplicaar
  BorderRadius _borderRadius() =>
      BorderRadius.vertical(top: Radius.circular(width * 0.13));
}
