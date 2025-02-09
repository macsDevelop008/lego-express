import 'package:flutter/material.dart';

/// Widget para un titulo y texto alineados.
class ShoppingCartTotalAccountTextWidget extends StatelessWidget {
  const ShoppingCartTotalAccountTextWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.leftText,
      required this.rightText,
      required this.sizeText,
      this.isBoldText});

  // Dimensiones
  final double height;
  final double width;

  // Texto izquierdo
  final String leftText;
  // Texto derecho
  final String rightText;
  // Tamaño del texto
  final double sizeText;
  // Letra ancha
  final bool? isBoldText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.yellow.withValues(alpha: 0),
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Espacio 1
          Flexible(
            flex: 1,
            child: Container(
              height: height,
              color: Colors.red.withValues(alpha: 0),
              alignment: Alignment.centerLeft,
              child: _text(leftText),
            ),
          ),
          // Espacio 2
          Flexible(
            flex: 1,
            child: Container(
              height: height,
              width: width * 0.5,
              color: Colors.green.withValues(alpha: 0),
              alignment: Alignment.centerRight,
              child: _text(rightText),
            ),
          ),
        ],
      ),
    );
  }

  /// Calcula el widget con Texto.
  ///
  /// @param [text] contiene el texto a dibujar.
  /// @return el widget Text configurado.
  Text _text(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: sizeText,
          fontWeight: (isBoldText != null && isBoldText!)
              ? FontWeight.w700
              : FontWeight.w200),
    );
  }
}
