import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';
import 'package:lego_express/presentation/presentation.dart';

Future<String> uiRequestDetailProductHelper(
    BuildContext context, ProductEntity productEntity) async {
  // Fuente de información
  final datasource = (TestValues.useTestProductDetail)
      ? RequestTestDatasourceImpl()
      : RequestDioDatasourceImpl();
  final repository = RequestRepositoryImpl(datasource: datasource);

  // Consulta
  final detailProduct = await repository.searchProductById(productEntity.id);

  // Si se generó un error
  if (detailProduct.$1 == GeneralRequestType.error) {
    showCustomDialog(
        context: context,
        type: DialogType.error,
        body: Text(
          'Se ha generado un error al consultar, vuelvelo a intentar.',
          style: TextStyle(fontSize: 18),
        ),
        onPressOk: () {
          context.go(ShoppingScreen.route);
        });
    return '';
  } else {
    // Referencia para usar los providers riverpod
    final ref = ProviderScope.containerOf(context);
    ref.read(listAllProductsProvider.notifier).updateProduct(
        productEntity.copyWith(description: detailProduct.$2?.description));

    return detailProduct.$2?.description ?? 'Sin información';
  }
}
