import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

Future uiEventItemDetailHelper(
    BuildContext context, ProductEntity productEntity) async {
  // Reiniciar provider que almacena el valor preparado para guardar en el carrito.
  final ref = ProviderScope.containerOf(context);
  ref.read(detailProductUnitToCartProvider.notifier).state =
      productEntity.unitCartList;
  //detailProductUnitToCartProvider
  // Ir a la vista detalle de producto
  context.go(ProductDetailScreen.route, extra: productEntity);
}
