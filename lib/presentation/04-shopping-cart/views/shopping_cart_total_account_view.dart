import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Vista con el listado total y precio del carrito.
class ShoppingCartTotalAccountView extends ConsumerWidget {
  const ShoppingCartTotalAccountView(
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
    double totalPrice = 0.0;
    for (var element in listItems) {
      totalPrice += element.price;
    }
    return Container(
      color: Colors.red.withValues(alpha: 0),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Espacio
          SizedBox(
            height: height * 0.2,
          ),
          // Subtotal
          ShoppingCartTotalAccountTextWidget(
            height: height * 0.14,
            width: width,
            leftText: 'Subtotal:',
            rightText: '\$$totalPrice',
            sizeText: height * 0.1,
          ),
          // Descuento
          ShoppingCartTotalAccountTextWidget(
            height: height * 0.14,
            width: width,
            leftText: 'Descuento:',
            rightText: '0%',
            sizeText: height * 0.1,
          ),
          // Linea decorativa
          Divider(),
          // Total
          ShoppingCartTotalAccountTextWidget(
            height: height * 0.15,
            width: width,
            leftText: 'Total:',
            rightText: '\$$totalPrice',
            sizeText: height * 0.12,
            isBoldText: true,
          ),
        ],
      ),
    );
  }
}
