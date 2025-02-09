import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingCartAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  const ShoppingCartAppBarView(
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
      leading: ShoppingCartLeadingWidget(
        paddingLeft: leadingPaddingLeft,
        event: () {
          print('atras');
        },
        color: AppColors(context: context).sixth,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
