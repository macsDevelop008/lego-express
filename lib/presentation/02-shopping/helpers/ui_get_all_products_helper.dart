import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';
import 'package:lego_express/presentation/presentation.dart';

Future uiGetAllProductsHelper(BuildContext context) async {
  // Referencia para usar los providers riverpod
  final ref = ProviderScope.containerOf(context);

  // Como el endPoint no se actualiza según la "compra" entonces se bloquea
  // la petición a a la lista de producto desde de que ya se hizo para poder
  // simular la venta de productos y el stock
  if (ref.read(listAllProductsProvider).isNotEmpty) return;

  // Fuente de información
  final datasource = RequestDioDatasourceImpl();
  final repository = RequestRepositoryImpl(datasource: datasource);

  // Consulta
  final products = await repository.getAllProducts();

  // Si se generó un error
  if (products.$1 == GeneralRequestType.error) {
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
    // Almacenar en el provider el listado de productos
    ref.read(listAllProductsProvider.notifier).newList(products.$2);
  }
}
