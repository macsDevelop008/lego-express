import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingCartButtonPayView extends ConsumerWidget {
  const ShoppingCartButtonPayView(
      {super.key,
      required this.height,
      required this.width,
      required this.appTheme});

  // Dimensiones
  final double height;
  final double width;
  // Tema de la app
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listItems = ref.watch(listAllProductsProvider).where((e) {
      return e.unitCartList > 0;
    });

    return GlobalButtonTextWidget(
        text: 'Ir a Pagar',
        sizeText: height * 0.05,
        height: height * 0.15,
        event: listItems.isNotEmpty
            ? () {
                uiShoppingCartBuyEventHelper(context);
              }
            : null);
  }
}
