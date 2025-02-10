// Borra del carrito de compras el producto pone en 0 sus unidades de compra.
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

Future uiShoppingCartDeleteEvent(
    BuildContext context, ProductEntity productEntity) async {
  showCustomDialog(
      context: context,
      type: DialogType.alert,
      body: Text(
        '¿Deseas eliminar del carrito el producto?',
        style: TextStyle(fontSize: 18),
      ),
      onPressOk: () {
        _confirm(context, productEntity);
      },
      onPressCancel: () {
        closeDialog(context);
      });
}

void _confirm(BuildContext context, ProductEntity productEntity) {
  final ref = ProviderScope.containerOf(context);
  // Actualizar a 0 las unidades seleccionadas para el carrito.
  ref
      .read(listAllProductsProvider.notifier)
      .updateProduct(productEntity.copyWith(unitCartList: 0));

  closeDialog(context);
}
