import 'package:flutter/material.dart';

import '../../../domain/entities/product/product_entity.dart';

/// Widget global que permite agregar y restar unidades con topes.
class GlobalAddUnitWidget extends StatefulWidget {
  const GlobalAddUnitWidget({
    super.key,
    required this.minValue,
    required this.buttonsSize,
    required this.textUnitSize,
    required this.buttonEnabledColor,
    required this.buttonDisabledColor,
    required this.spaceHorizontalBeetwenElemnts,
    required this.productEntity,
  });

  // Tope minimo
  final int minValue;
  // Tamaño botones
  final double buttonsSize;
  // Color boton habilitado
  final Color buttonEnabledColor;
  // Color boton deshabilitado
  final Color buttonDisabledColor;
  // Tamaño texto unidad
  final double textUnitSize;
  // Espacio entre elementos
  final double spaceHorizontalBeetwenElemnts;
  // Información del producto
  final ProductEntity productEntity;

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
            heroTag: 'unic-2',
            onPressed: _activeSubtractButton() ? () {} : null,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.buttonsSize * 0.2),
            ),
            backgroundColor: _activeSubtractButton()
                ? widget.buttonEnabledColor
                : widget.buttonDisabledColor,
            child: Icon(
              Icons.remove,
              size: widget.buttonsSize * 0.5,
            ),
          ),
        ),
        // Número unidad
        Text(
          '${widget.productEntity.unitCartList}',
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: widget.textUnitSize),
        ),
        // Botón sumar
        SizedBox(
          width: widget.buttonsSize,
          height: widget.buttonsSize,
          child: FloatingActionButton(
            heroTag: 'unic-1',
            onPressed: _activeAddButton() ? () {} : null,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.buttonsSize * 0.2),
            ),
            backgroundColor: _activeAddButton()
                ? widget.buttonEnabledColor
                : widget.buttonDisabledColor,
            child: Icon(
              Icons.add,
              size: widget.buttonsSize * 0.5,
            ),
          ),
        ),
      ],
    );
  }

  bool _activeSubtractButton() {
    return widget.productEntity.stock > 0 &&
        widget.productEntity.unitCartList > 1;
  }

  bool _activeAddButton() {
    return widget.productEntity.stock > 0 &&
        widget.productEntity.unitCartList < widget.productEntity.stock;
  }
}
