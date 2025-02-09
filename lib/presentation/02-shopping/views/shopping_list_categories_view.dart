import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingListCategoriesView extends StatelessWidget {
  const ShoppingListCategoriesView(
      {super.key,
      required this.height,
      required this.width,
      required this.topMargin,
      required this.bottomMargin,
      required this.appTheme});

  // Alto de la vista.
  final double height;
  // Ancho de la vista.
  final double width;
  // Margin superior
  final double topMargin;
  // Margin inferior
  final double bottomMargin;
  // Tema de la app
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withValues(alpha: 0),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      height: height,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: width * 0.02,
          children: [
            _itemListCategorie(
                'assets/images/categories/categoria_carro_lego.png', 'Carros'),
            _itemListCategorie(
                'assets/images/categories/categoria_camion_lego.png',
                'Camiones'),
            _itemListCategorie(
                'assets/images/categories/categoria_avion_lego.png', 'Aviones'),
            _itemListCategorie(
                'assets/images/categories/categoria_moto_lego.png', 'Motos'),
            _itemListCategorie(
                'assets/images/categories/categoria_escavadora_lego.png',
                'Escavadora'),
            _itemListCategorie(
                'assets/images/categories/categoria_personaje_lego.png',
                'Personajes'),
          ],
        ),
      ),
    );
  }

  /// Item para la lista de categorias.
  ///
  /// @param [routImage] Ruta de la image.
  /// @param [title] Titulo del item.
  /// @return  Un Widget que representa una categoria.
  ShoppingCategorieItemWidget _itemListCategorie(
      String routeImgage, String title) {
    return ShoppingCategorieItemWidget(
      height: height * 0.55,
      width: width * 0.38,
      backgroundColor: appTheme.primaryColor,
      shadowColor: Colors.transparent,
      borderRadiusValue: width * 0.1,
      routeImage: routeImgage,
      title: title,
    );
  }
}
