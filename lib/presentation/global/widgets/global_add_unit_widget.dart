import 'package:flutter/material.dart';

/// Widget global que permite agregar y restar unidades con topes.
class GlobalAddUnitWidget extends StatefulWidget {
  const GlobalAddUnitWidget(
      {super.key,
      required this.maxValue,
      required this.minValue,
      required this.buttonsSize,
      required this.textUnitSize,
      required this.buttonEnabled,
      required this.buttonDisabled,
      required this.spaceHorizontalBeetwenElemnts});

  // Topes - Max es la cantidad en stock
  final int maxValue;
  final int minValue;

  // Tamaño botones
  final double buttonsSize;
  // Colo boton habilitado
  final Color buttonEnabled;
  // Colo boton deshabilitado
  final Color buttonDisabled;
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
      spacing: widget.spaceHorizontalBeetwenElemnts,
      children: [
        // Botón restar
        FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          backgroundColor: widget.buttonEnabled,
          child: Icon(Icons.remove),
        ),
        // Número unidad
        Text(
          '1',
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: widget.textUnitSize),
        ),
        // Botón sumar
        FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          backgroundColor: widget.buttonDisabled,
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
