import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';

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
  // Actual cantidad en el carrito
  late int _unitCartList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _unitCartList = widget.productEntity.unitCartList;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
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
                onPressed: _unitCartList > 0
                    ? () {
                        _unitCartList--;
                        ref
                            .read(detailProductUnitToCartProvider.notifier)
                            .state = _unitCartList;
                        setState(() {});
                      }
                    : null,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.buttonsSize * 0.2),
                ),
                backgroundColor: _unitCartList > 0
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
              '$_unitCartList',
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: widget.textUnitSize),
            ),
            // Botón sumar
            SizedBox(
              width: widget.buttonsSize,
              height: widget.buttonsSize,
              child: FloatingActionButton(
                heroTag: 'unic-1',
                onPressed: _unitCartList < widget.productEntity.stock
                    ? () {
                        _unitCartList++;
                        ref
                            .read(detailProductUnitToCartProvider.notifier)
                            .state = _unitCartList;
                        setState(() {});
                      }
                    : null,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.buttonsSize * 0.2),
                ),
                backgroundColor: _unitCartList < widget.productEntity.stock
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
      },
    );
  }
}
