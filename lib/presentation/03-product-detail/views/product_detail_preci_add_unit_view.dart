import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Vista que contiene el precio y la unidad a agregar.
class ProductDetailPreciAddUnitView extends StatelessWidget {
  const ProductDetailPreciAddUnitView(
      {super.key,
      required this.height,
      required this.width,
      required this.currentUnitStock,
      required this.preci,
      required this.appTheme});

  // Espacio a ocupar por la descripción
  final double height;
  final double width;
  // Cantidad actual en stock
  final int currentUnitStock;
  // Precio
  final double preci;
  // Tema de la aplicación
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue.withValues(alpha: 0),
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Precio
          Text(
            '\$$preci',
            style:
                TextStyle(fontSize: height * 0.32, fontWeight: FontWeight.w700),
          ),
          // Unidades
          GlobalAddUnitWidget(
            maxValue: currentUnitStock,
            minValue: 0,
            buttonsSize: height * 0.6,
            textUnitSize: height * 0.3,
            buttonEnabledColor: AppColors.fifthLight,
            buttonDisabledColor: AppColors.fifthDark.withValues(alpha: 0.3),
            spaceHorizontalBeetwenElemnts: width * 0.05,
          ),
        ],
      ),
    );
  }
}
