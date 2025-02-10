// Borra del carrito de compras el producto pone en 0 sus unidades de compra.
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';

Future uiShoppingCartDeleteEvent(
    BuildContext context, ProductEntity productEntity) async {
  final ref = ProviderScope.containerOf(context);
  ref
      .read(listAllProductsProvider.notifier)
      .updateProduct(productEntity.copyWith(unitCartList: 0));
}
