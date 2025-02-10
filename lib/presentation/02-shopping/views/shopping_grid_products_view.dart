import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingGridProductsView extends ConsumerWidget {
  const ShoppingGridProductsView(
      {super.key,
      required this.height,
      required this.width,
      required this.appTheme});

  // Alto de la vista.
  final double height;
  // Ancho de la vista.
  final double width;
  // Tema de la app.
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // listado de productos según el provider
    final productsList = ref.watch(listAllProductsProvider);

    return Container(
      alignment: Alignment.center,
      color: Colors.orange.withValues(alpha: 0.0),
      width: width,
      height: height,
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Espacio inicial.
          SizedBox(
            height: height * 0.15,
          ),
          // Item.
          StaggeredGrid.count(
            crossAxisCount: 2, // 2 columnas
            mainAxisSpacing: 0, // Espacio vertical entre ítems
            crossAxisSpacing: 0, // Espacio horizontal entre ítems
            children: List.generate(productsList.length, (i) {
              final double verticalOffset = _verticalOffset(i);
              return Transform.translate(
                offset: Offset(0, verticalOffset),
                child: ShoppingProductItemWidget(
                  heightBase: height * 0.55,
                  widthBase: width * 0.55,
                  backgroundColor: appTheme.primaryColor.withValues(alpha: 0.6),
                  borderRadiusValue: width * 0.05,
                  productEntity: productsList[i],
                  colorIconButton: appTheme.primaryColor,
                  event: () {
                    uiEventItemAddToCartListHelper(context, productsList[i]);
                  },
                ),
              );
            }),
          ),
        ],
      )),
    );
  }

  /// Realiza el calculo de "descuadre"
  double _verticalOffset(int i) {
    return i % 2 == 0 ? -height * 0.10 : 0.0;
  }
}
