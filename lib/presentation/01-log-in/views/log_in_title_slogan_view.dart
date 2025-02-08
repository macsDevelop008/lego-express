import 'package:flutter/material.dart';

/// Vista del título y eslogan de la pantalla de inicio de sesión.
class LogInTitleSloganView extends StatelessWidget {
  const LogInTitleSloganView(
      {super.key,
      required this.titleSize,
      required this.sloganSize,
      required this.height,
      required this.width});

  // Tamaño del título.
  final double titleSize;
  // Tamaño del eslogan.
  final double sloganSize;
  // Alto del espacio a ocupar.
  final double height;
  // Ancho del espacio a ocupar.
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red.withValues(alpha: 0),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Titulo de la app.
          Text(
            'Lego Express',
            style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w600),
          ),
          // Eslogan de la app.
          Text(
            'Tus Legos favoritos a un clic, construye tus sueños y da vida a tu imaginación.',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: sloganSize, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
