import 'package:flutter/material.dart';

class GlobalTextFieldWidget extends StatefulWidget {
  const GlobalTextFieldWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.backgroundColor,
      required this.borderRadiusValue});

  // Ancho del widget.
  final double width;
  // Alto del widget.
  final double height;
  // Valor de los bordes redondeados
  final double borderRadiusValue;
  // Color de fondo.
  final Color backgroundColor;

  @override
  State<GlobalTextFieldWidget> createState() => _GlobalTextFieldWidgetState();
}

class _GlobalTextFieldWidgetState extends State<GlobalTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius:
              BorderRadius.all(Radius.circular(widget.borderRadiusValue))),
    );
  }
}
