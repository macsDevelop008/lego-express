import 'package:flutter/material.dart';

/// Widget global que permite agregar y restar unidades con topes.
class GlobalAddUnitWidget extends StatefulWidget {
  const GlobalAddUnitWidget(
      {super.key,
      required this.maxValue,
      required this.minValue,
      required this.buttonsSize,
      required this.textUnitSize,
      required this.buttonEnabledColor,
      required this.buttonDisabledColor,
      required this.spaceHorizontalBeetwenElemnts});

  // Topes - Max es la cantidad en stock
  final int maxValue;
  final int minValue;

  // Tamaño botones
  final double buttonsSize;
  // Colo boton habilitado
  final Color buttonEnabledColor;
  // Colo boton deshabilitado
  final Color buttonDisabledColor;
  // Tamaño texto unidad
  final double textUnitSize;
  // Espacio entre elementos
  final double spaceHorizontalBeetwenElemnts;

  @override
  State<GlobalAddUnitWidget> createState() => _GlobalAddUnitWidgetState();
}

class _GlobalAddUnitWidgetState extends State<GlobalAddUnitWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: widget.spaceHorizontalBeetwenElemnts,
      children: [
        // Botón restar
        SizedBox(
          width: widget.buttonsSize,
          height: widget.buttonsSize,
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.buttonsSize * 0.2),
            ),
            backgroundColor: widget.buttonEnabledColor,
            child: Icon(
              Icons.remove,
              size: widget.buttonsSize * 0.5,
            ),
          ),
        ),
        // Número unidad
        Text(
          '99',
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: widget.textUnitSize),
        ),
        // Botón sumar
        SizedBox(
          width: widget.buttonsSize,
          height: widget.buttonsSize,
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.buttonsSize * 0.2),
            ),
            backgroundColor: widget.buttonDisabledColor,
            child: Icon(
              Icons.add,
              size: widget.buttonsSize * 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
