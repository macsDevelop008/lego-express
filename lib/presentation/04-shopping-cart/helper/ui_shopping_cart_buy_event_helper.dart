import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';
import 'package:lego_express/presentation/presentation.dart';

Future uiShoppingCartBuyEventHelper(BuildContext context) async {
  showCustomDialog(
      context: context,
      type: DialogType.alert,
      body: Text(
        '¿Deseas realizar el pago de los productos?.',
        style: TextStyle(fontSize: 18),
      ),
      onPressOk: () {
        _confirm(context);
      },
      onPressCancel: () {
        closeDialog(context);
      });
}

Future _confirm(BuildContext context) async {
  // Modal de carga
  showLoadingDialog(context);
  // Delay
  await Future.delayed(Duration(seconds: 2));
  // Fuente de información
  final datasource = (TestValues.useTestBuyProducts)
      ? RequestTestDatasourceImpl()
      : RequestDioDatasourceImpl();
  final repository = RequestRepositoryImpl(datasource: datasource);

  // Petición
  final products = await repository.buyProdycts();

  // Si se generó un error
  if (products.$1 == GeneralRequestType.error) {
    // Cerrar modal de carga
    closeDialog(context);
    showCustomDialog(
        context: context,
        type: DialogType.error,
        body: Text(
          'Se ha generado un error al consultar, vuelvelo a intentar.',
          style: TextStyle(fontSize: 18),
        ),
        onPressOk: () {
          context.go(InitialScreen.route);
        });
  } else {
    // Actualizar listado de productos
    final ref = ProviderScope.containerOf(context);
    ref.read(listAllProductsProvider.notifier).newList(products.$2!);
    // Cerrar modal de carga
    closeDialog(context);
    // Mostrar modal hecho
    showCustomDialog(
        context: context,
        type: DialogType.success,
        body: Text(
          '¡Tu compra ha sido realizada con éxito!',
          style: TextStyle(fontSize: 18),
        ),
        onPressOk: () {
          context.go(ShoppingScreen.route);
        });
  }
}
