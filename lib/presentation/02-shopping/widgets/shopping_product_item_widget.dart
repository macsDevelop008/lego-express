import 'package:flutter/material.dart';
import 'package:lego_express/domain/domain.dart';

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
        child: Column(
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
                          fontSize: heightItem * 0.07,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                )),
            // Imagen
            Container(
              alignment: Alignment.center,
              color: Colors.yellow.withValues(alpha: 0),
              width: widthItem * 0.5,
              height: widthItem * 0.5,
              child: Image.network(
                productEntity.pathNetworkImage,
                fit: BoxFit.contain,
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
                          fontSize: heightItem * 0.07,
                          fontWeight: FontWeight.w500),
                    ),
                    // Botón carrito
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(heightItem * 0.05),
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.shopping_cart,
                        size: heightItem * 0.1,
                        color: colorIconButton,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
