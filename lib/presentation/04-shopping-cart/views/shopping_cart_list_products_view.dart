import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

final testList = [
  ProductCartEntity(
      productEntityInformation: ProductEntity(
          pathNetworkImage:
              'https://www.lego.com/cdn/cs/set/assets/blte57c48b15e5c3dd7/854189.png',
          title: 'Llavero de Black Panther',
          description:
              'Duis veniam est in nostrud fugiat qui irure. Eiusmod proident minim nisi minim exercitation amet velit ea reprehenderit. Pariatur exercitation do sint elit minim sunt ad esse reprehenderit. Ex veniam culpa deserunt nulla veniam ad minim tempor.',
          price: 34,
          stock: 9),
      unitsSelected: 2),
  ProductCartEntity(
      productEntityInformation: ProductEntity(
          pathNetworkImage:
              'https://www.lego.com/cdn/cs/set/assets/blte57c48b15e5c3dd7/854189.png',
          title: 'Llavero de Black Panther',
          description:
              'Duis veniam est in nostrud fugiat qui irure. Eiusmod proident minim nisi minim exercitation amet velit ea reprehenderit. Pariatur exercitation do sint elit minim sunt ad esse reprehenderit. Ex veniam culpa deserunt nulla veniam ad minim tempor.',
          price: 34,
          stock: 9),
      unitsSelected: 2),
  ProductCartEntity(
      productEntityInformation: ProductEntity(
          pathNetworkImage:
              'https://www.lego.com/cdn/cs/set/assets/blte57c48b15e5c3dd7/854189.png',
          title: 'Llavero de Black Panther',
          description:
              'Duis veniam est in nostrud fugiat qui irure. Eiusmod proident minim nisi minim exercitation amet velit ea reprehenderit. Pariatur exercitation do sint elit minim sunt ad esse reprehenderit. Ex veniam culpa deserunt nulla veniam ad minim tempor.',
          price: 34,
          stock: 9),
      unitsSelected: 2),
  ProductCartEntity(
      productEntityInformation: ProductEntity(
          pathNetworkImage:
              'https://www.lego.com/cdn/cs/set/assets/blte57c48b15e5c3dd7/854189.png',
          title: 'Llavero de Black Panther',
          description:
              'Duis veniam est in nostrud fugiat qui irure. Eiusmod proident minim nisi minim exercitation amet velit ea reprehenderit. Pariatur exercitation do sint elit minim sunt ad esse reprehenderit. Ex veniam culpa deserunt nulla veniam ad minim tempor.',
          price: 34,
          stock: 9),
      unitsSelected: 2),
];

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
