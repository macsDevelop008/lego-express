import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Widget Item productos.
class ShoppingProductItemWidget extends StatelessWidget {
  const ShoppingProductItemWidget({
    super.key,
    required this.heightBase,
    required this.widthBase,
    required this.backgroundColor,
    required this.borderRadiusValue,
    required this.productEntity,
    required this.colorIconButton,
    required this.event,
  });

  // Alto de la vista.
  final double heightBase;
  // Ancho de la vista.
  final double widthBase;
  // Border redondeados
  final double borderRadiusValue;
  // Color del fondo.
  final Color backgroundColor;
  // Información del producto.
  final ProductEntity productEntity;
  // Color del icono del botón.
  final Color colorIconButton;
  // Evento del boton
  final Function() event;

  @override
  Widget build(BuildContext context) {
    final widthItem = widthBase * 0.8;
    final heightItem = heightBase * 0.9;

    return
        // Base
        Container(
      alignment: Alignment.center,
      height: heightBase,
      width: widthBase,
      color: Colors.red.withValues(alpha: 0),
      child:
          // Item
          Container(
        alignment: Alignment.center,
        width: widthItem,
        height: heightItem,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Data e información del item
            _dataItem(widthItem, heightItem),
            // Eevento para ir al detalle de producto
            Positioned(
              top: 0,
              child: SizedBox(
                height: heightItem * 0.5,
                width: widthItem,
                child: GestureDetector(
                  onTap: () {
                    uiEventItemDetailHelper(context, productEntity);
                  },
                ),
              ),
            ),
            // Número de productos en el carrito, mostrar si es mayor a 0
            Visibility(
              visible: productEntity.unitCartList > 0,
              child: Positioned(
                  bottom: widthItem * 0.05,
                  right: heightItem * 0.06,
                  child: Text(
                    productEntity.unitCartList.toString(),
                    style: TextStyle(
                        color: AppColors(context: context).third,
                        fontSize: heightItem * 0.08),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Column _dataItem(double widthItem, double heightItem) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Unidades disponibles
        Container(
            alignment: Alignment.centerRight,
            width: widthItem * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Stock: ',
                  style: TextStyle(fontSize: heightItem * 0.07),
                ),
                Text(
                  productEntity.stock.toString(),
                  style: TextStyle(
                      fontSize: heightItem * 0.07, fontWeight: FontWeight.w800),
                )
              ],
            )),
        // Imagen
        Container(
          alignment: Alignment.center,
          color: Colors.yellow.withValues(alpha: 0),
          width: widthItem * 0.5,
          height: widthItem * 0.5,
          child: GlobalImageNetworkLoadingWidget(
            url: productEntity.pathNetworkImage,
          ),
        ),
        // Titulo y Precio
        Container(
            width: widthItem,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: widthItem * 0.07),
            color: Colors.red.withValues(alpha: 0),
            child: Column(
              children: [
                // Titulo o nombre
                Text(
                  productEntity.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: heightItem * 0.065,
                      fontWeight: FontWeight.w700),
                ),
                // Precio
                Text(
                  '\$${productEntity.price}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: heightItem * 0.07, fontWeight: FontWeight.w500),
                ),
                // Botón carrito
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(heightItem * 0.05),
                  ),
                  onPressed: () {
                    event();
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    size: heightItem * 0.1,
                    color: colorIconButton,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
