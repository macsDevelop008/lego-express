import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

/// AppBar de la pantalla Shopping.
class ShoppingAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  const ShoppingAppBarView(
      {super.key,
      required this.leadingPaddingLeft,
      required this.appTheme,
      required this.actionProfileUserSize});

  // Padding izquierdo para el botón izquierdo.
  final double leadingPaddingLeft;
  // Tamaño para el botón derecho del perfil.
  final double actionProfileUserSize;
  // Tema de la aplicación.
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // Botón back izquierdo.
      leading: ShoppingLeadingWidget(
        paddingLeft: leadingPaddingLeft,
        event: () {
          print('menú');
        },
        color: AppColors(context: context).sixth,
      ),
      // Botones a la  derecha.
      actions: [
        ShoppingImageUserWidget(
          size: actionProfileUserSize,
          color: AppColors(context: context).sixth,
        )
      ],
    );
  }

  /// Define el tamaño del appBar.
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
