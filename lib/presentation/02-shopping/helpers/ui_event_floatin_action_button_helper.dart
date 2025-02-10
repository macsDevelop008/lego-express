import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/presentation/presentation.dart';

Future uiEventFloatingActionButtonHelper(BuildContext context) async {
  // Ir a la vista comprar productos
  context.go(ShoppingCartScreen.route);
}
