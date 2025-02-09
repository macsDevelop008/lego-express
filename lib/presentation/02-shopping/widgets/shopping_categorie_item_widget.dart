import 'package:flutter/material.dart';

/// Widget para los items de las categorías.
class ShoppingCategorieItemWidget extends StatelessWidget {
  const ShoppingCategorieItemWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.backgroundColor,
      required this.shadowColor,
      required this.borderRadiusValue,
      required this.routeImage,
      required this.title});

  // Alto de la vista.
  final double height;
  // Ancho de la vista.
  final double width;
  // Bordes redondeados
  final double borderRadiusValue;
  // Color de fondo
  final Color backgroundColor;
  // Color de la sombra
  final Color shadowColor;
  // Ruta de la imagen
  final String routeImage;
  // Titulo
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue)),
          boxShadow: [
            BoxShadow(
                color: Colors.transparent, //shadowColor,
                blurRadius: height * 0.05,
                spreadRadius: width * 0.01)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: width * 0.05,
        children: [
          // Imagen.
          Transform.scale(
            scale: 1.2,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(routeImage),
            ),
          ),
          // Titulo
          Text(
            title,
            style:
                TextStyle(fontSize: height * 0.35, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
