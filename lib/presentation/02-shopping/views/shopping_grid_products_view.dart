import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingGridProductsView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final testList = [
      ProductEntity(
          pathNetworkImage:
              'https://cdn.merlinsbricks.com/images/LEGO-76920/LEGO-76920-1.webp?v=2',
          title: 'Llavero de Nueva York',
          price: 250,
          description:
              '¡Los fans de la Gran Manzana van a adorar el Llavero de Nueva York LEGO® Iconic (854032)! Cuenta con una minifigura ataviada con una gorra de béisbol y una camiseta con las palabras “New York” impresas, unida a una resistente anilla con una cadena metálica. Una manera perfecta de tener las llaves a mano y localizadas, o de añadir un llamativo toque de estilo neoyorquino a una mochila, una fiambrera o lo que se te ocurra.',
          stock: 1),
      ProductEntity(
          pathNetworkImage:
              'https://cdn.merlinsbricks.com/images/LEGO-76920/LEGO-76920-1.webp?v=2',
          title: 'Carro Test 1',
          price: 9,
          description:
              '¡Los fans de la Gran Manzana van a adorar el Llavero de Nueva York LEGO® Iconic (854032)! Cuenta con una minifigura ataviada con una gorra de béisbol y una camiseta con las palabras “New York” impresas, unida a una resistente anilla con una cadena metálica. Una manera perfecta de tener las llaves a mano y localizadas, o de añadir un llamativo toque de estilo neoyorquino a una mochila, una fiambrera o lo que se te ocurra.',
          stock: 3),
      ProductEntity(
          pathNetworkImage:
              'https://cdn.merlinsbricks.com/images/LEGO-76920/LEGO-76920-1.webp?v=2',
          title: 'Carro Test 1',
          price: 250,
          description:
              '¡Los fans de la Gran Manzana van a adorar el Llavero de Nueva York LEGO® Iconic (854032)! Cuenta con una minifigura ataviada con una gorra de béisbol y una camiseta con las palabras “New York” impresas, unida a una resistente anilla con una cadena metálica. Una manera perfecta de tener las llaves a mano y localizadas, o de añadir un llamativo toque de estilo neoyorquino a una mochila, una fiambrera o lo que se te ocurra.',
          stock: 6),
      ProductEntity(
          pathNetworkImage:
              'https://cdn.merlinsbricks.com/images/LEGO-76920/LEGO-76920-1.webp?v=2',
          title: 'Carro Test 1',
          price: 250,
          description:
              '¡Los fans de la Gran Manzana van a adorar el Llavero de Nueva York LEGO® Iconic (854032)! Cuenta con una minifigura ataviada con una gorra de béisbol y una camiseta con las palabras “New York” impresas, unida a una resistente anilla con una cadena metálica. Una manera perfecta de tener las llaves a mano y localizadas, o de añadir un llamativo toque de estilo neoyorquino a una mochila, una fiambrera o lo que se te ocurra.',
          stock: 2),
      ProductEntity(
          pathNetworkImage:
              'https://cdn.merlinsbricks.com/images/LEGO-76920/LEGO-76920-1.webp?v=2',
          title: 'Carro Test 1',
          price: 4,
          description:
              '¡Los fans de la Gran Manzana van a adorar el Llavero de Nueva York LEGO® Iconic (854032)! Cuenta con una minifigura ataviada con una gorra de béisbol y una camiseta con las palabras “New York” impresas, unida a una resistente anilla con una cadena metálica. Una manera perfecta de tener las llaves a mano y localizadas, o de añadir un llamativo toque de estilo neoyorquino a una mochila, una fiambrera o lo que se te ocurra.',
          stock: 1),
    ];
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
            children: List.generate(testList.length, (i) {
              final double verticalOffset = _verticalOffset(i);
              return Transform.translate(
                offset: Offset(0, verticalOffset),
                child: ShoppingProductItemWidget(
                  heightBase: height * 0.55,
                  widthBase: width * 0.55,
                  backgroundColor: appTheme.primaryColor.withValues(alpha: 0.6),
                  borderRadiusValue: width * 0.05,
                  productEntity: testList[i],
                  colorIconButton: appTheme.primaryColor,
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
