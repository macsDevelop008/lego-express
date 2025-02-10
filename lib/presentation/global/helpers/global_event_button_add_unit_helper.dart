import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

Future globalEventButtonAddUnitHelper(
    BuildContext context, ProductEntity productEntity) async {
  showCustomDialog(
    context: context,
    type: DialogType.alert,
    body: Text(
      '¿Deseas agregar las unidades al carrito?',
      style: TextStyle(fontSize: 18),
    ),
    onPressCancel: () {
      closeDialog(context);
    },
    onPressOk: () async {
      await _confirm(context, productEntity);
    },
  );
}

Future _confirm(BuildContext context, ProductEntity productEntity) async {
  final ref = ProviderScope.containerOf(context);
  final currentUnitCart = ref.read(detailProductUnitToCartProvider);

  // Agregar unidades del carrito al producto
  ref
      .read(listAllProductsProvider.notifier)
      .updateProduct(productEntity.copyWith(unitCartList: currentUnitCart));

  // Regresar a la vista de productos principal
  context.go(ShoppingScreen.route);
}
