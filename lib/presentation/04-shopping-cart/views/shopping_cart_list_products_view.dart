import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

final testList = [];

/// Vista que contiene el listado de productos seeccionados para la compra.
class ShoppingCartListProductsView extends StatelessWidget {
  const ShoppingCartListProductsView(
      {super.key,
      required this.height,
      required this.width,
      required this.theme});

  // Dimensiones
  final double height;
  final double width;
  // Tema de la app
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        color: Colors.orange.withValues(alpha: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: height * 0.05,
            children: List.generate(testList.length, (index) {
              return ShoppingCardProductWidget(
                height: height * 0.38,
                width: width * 0.9,
                backgroundColor: theme.primaryColor.withValues(alpha: 0.7),
                dataProduct: testList[index],
                buttonEnabledColor: AppColors(context: context).fifth,
                buttonDisabledColor:
                    AppColors(context: context).fifth.withValues(alpha: 0.3),
                iconDelteColor:
                    AppColors(context: context).sixth.withValues(alpha: 0.5),
              );
            }),
          ),
        )
        /*ShoppingCardProductWidget(
        height: height * 0.38,
        width: width * 0.9,
        backgroundColor: theme.primaryColor.withValues(alpha: 0.7),
        dataProduct: testList[1],
        buttonEnabledColor: AppColors(context: context).fifth,
        buttonDisabledColor:
            AppColors(context: context).fifth.withValues(alpha: 0.3),
        iconDelteColor:
            AppColors(context: context).sixth.withValues(alpha: 0.5),
      ),*/
        );
  }
}
