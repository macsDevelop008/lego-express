import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Vista que contiene el precio y la unidad a agregar.
class ProductDetailPreciAddUnitView extends StatelessWidget {
  const ProductDetailPreciAddUnitView(
      {super.key,
      required this.height,
      required this.width,
      required this.appTheme,
      required this.productEntity});

  // Espacio a ocupar por la descripción
  final double height;
  final double width;
  // Tema de la aplicación
  final ThemeData appTheme;
  //
  final ProductEntity productEntity;

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
            '\$${productEntity.price}',
            style:
                TextStyle(fontSize: height * 0.32, fontWeight: FontWeight.w700),
          ),
          // Unidades
          GlobalAddUnitWidget(
            minValue: 0,
            buttonsSize: height * 0.6,
            textUnitSize: height * 0.3,
            buttonEnabledColor: AppColors.fifthLight,
            buttonDisabledColor: AppColors.fifthDark.withValues(alpha: 0.3),
            spaceHorizontalBeetwenElemnts: width * 0.05,
            productEntity: productEntity,
          ),
        ],
      ),
    );
  }
}
