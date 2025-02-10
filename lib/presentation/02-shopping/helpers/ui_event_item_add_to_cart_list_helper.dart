import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';

Future uiEventItemAddToCartListHelper(
    BuildContext context, ProductEntity productEntity) async {
  // Obtener cantidad total en el stock
  final unitStock = productEntity.stock;
  // Obtener cantidad total en el carrito
  final unityCart = productEntity.unitCartList;

  // Si las unidades en carrito son menores al stock
  if (unityCart < unitStock) {
    //
    final newUnitCartList = unityCart + 1;
    // Provider con el listado de productos
    final ref = ProviderScope.containerOf(context);
    ref
        .read(listAllProductsProvider.notifier)
        .updateProduct(productEntity.copyWith(unitCartList: newUnitCartList));
  } else {
    // Ocultar el snackbar actual, si existe
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // Abrir snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Limite alcanzado.'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
