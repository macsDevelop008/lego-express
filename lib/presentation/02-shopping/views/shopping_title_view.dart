import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Vista con el titulo inicial de la pantalla Shopping.
class ShoppingTitleView extends StatelessWidget {
  const ShoppingTitleView(
      {super.key,
      required this.height,
      required this.width,
      required this.marginTop,
      required this.paddingLeft});

  // Alto de la vista.
  final double height;
  // Ancho de la vista.
  final double width;
  // Margen superior de la vista.
  final double marginTop;
  // Padding izquierdo de la vista.
  final double paddingLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: marginTop),
      padding: EdgeInsets.only(left: paddingLeft),
      color: Colors.red.withValues(alpha: 0),
      height: height,
      width: width,
      child: ShoppingTextImageWidget(
        textSize: height * 0.44,
        imageSize: height * 0.008,
        routeImage: 'assets/images/hand.png',
        maxSizeHorizontal: width * 0.7,
        text: 'Hola, Usuario!',
      ),
    );
  }
}
