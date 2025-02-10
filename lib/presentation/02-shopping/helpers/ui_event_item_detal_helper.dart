import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

Future uiEventItemDetailHelper(
    BuildContext context, ProductEntity productEntity) async {
  // Ir a la vista detalle de producto
  context.go(ProductDetailScreen.route, extra: productEntity);
}
