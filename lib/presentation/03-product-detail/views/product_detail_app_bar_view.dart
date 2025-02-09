import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

class ProductDetailAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailAppBarView(
      {super.key, required this.leadingPaddingLeft, required this.appTheme});

  // Padding izquierdo para el botón izquierdo.
  final double leadingPaddingLeft;
  // Tema de la aplicación.
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // Botón back izquierdo.
      leading: ProductDetailLeadingWidget(
        paddingLeft: leadingPaddingLeft,
        event: () {
          print('atras');
        },
        color: AppColors(context: context).sixth,
      ),
    );
  }

  /// Define el tamaño del appBar.
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
