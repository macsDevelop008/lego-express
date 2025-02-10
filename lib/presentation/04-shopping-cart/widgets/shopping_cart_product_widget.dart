import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';
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
      required this.buttonDisabledColor,
      required this.iconDelteColor});

  // Dimensiones
  final double height;
  final double width;
  // Color del fondo
  final Color backgroundColor;
  // Datos del producto
  final ProductEntity dataProduct;
  // Color btm seleccionado widget agregar y eliminar unidad
  final Color buttonEnabledColor;
  // Color btm deseleccionado widget agregar y eliminar unidad
  final Color buttonDisabledColor;
  // Color icono eliminar
  final Color iconDelteColor;

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
              size: height, urlImage: dataProduct.pathNetworkImage),
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
                      dataProduct.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    // Precio total
                    Text(
                      '\$123',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: height * 0.15),
                    ),
                    Text(
                      'Cantidad: ${dataProduct.unitCartList}',
                      style: TextStyle(fontSize: 18),
                    ),
                    // Agregar y eliminar unidad de producto
                    /*GlobalAddUnitWidget(
                      minValue: 0,
                      buttonsSize: height * 0.3,
                      textUnitSize: height * 0.12,
                      buttonEnabledColor: buttonEnabledColor,
                      buttonDisabledColor: buttonDisabledColor,
                      spaceHorizontalBeetwenElemnts: width * 0.025,
                      productEntity: dataProduct,
                    ),*/
                  ],
                ),
              );
            },
          )),
          // Botón eliminar
          Container(
            width: width * 0.14,
            height: height,
            color: Colors.red.withValues(alpha: 0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outlined,
                  size: height * 0.25,
                  color: iconDelteColor,
                )),
          )
        ],
      ),
    );
  }
}
