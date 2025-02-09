import 'package:flutter/material.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingCardProductWidget extends StatelessWidget {
  const ShoppingCardProductWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.backgroundColor,
      required this.dataProduct,
      required this.buttonEnabledColor,
      required this.buttonDisabledColor});

  // Dimensiones
  final double height;
  final double width;
  // Color del fondo
  final Color backgroundColor;
  // Datos del producto
  final ProductCartEntity dataProduct;
  // Color btm seleccionado widget agregar y eliminar unidad
  final Color buttonEnabledColor;
  // Color btm deseleccionado widget agregar y eliminar unidad
  final Color buttonDisabledColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(height * 0.2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagen
          GlobalNetworkImageWidget(
              size: height,
              urlImage: dataProduct.productEntityInformation.pathNetworkImage),
          Expanded(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final x = constraints.maxWidth;
              final y = constraints.maxHeight;

              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: x * 0.08),
                width: x,
                height: y,
                color: Colors.red.withValues(alpha: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Titulo o nombre
                    Text(
                      dataProduct.productEntityInformation.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    // Precio total
                    Text('\$123'),
                    // Agregar y eliminar unidad de producto
                    GlobalAddUnitWidget(
                        maxValue: dataProduct.productEntityInformation.stock,
                        minValue: 0,
                        buttonsSize: height * 0.3,
                        textUnitSize: height * 0.12,
                        buttonEnabledColor: buttonEnabledColor,
                        buttonDisabledColor: buttonDisabledColor,
                        spaceHorizontalBeetwenElemnts: width * 0.025),
                  ],
                ),
              );
            },
          )),
          //
          Container(
            width: 40,
            color: Colors.red,
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
