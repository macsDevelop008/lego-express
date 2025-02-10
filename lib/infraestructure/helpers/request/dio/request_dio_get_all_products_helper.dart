import 'dart:convert';

import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';

/// Obtiene todos los productos en una peticion.
Future<(GeneralRequestType, List<ProductEntity>)> getAllProductsHelper(
    String endPointUrl) async {
  List<ProductEntity> result = [];

  // Dio singleton
  final dio = await RequestDioSingletonHelper.shared.instace;

  // Peticion
  final response = await dio.get(endPointUrl);

  // Tratamiento de error
  if (response.statusCode != 200) {
    throw ('Error, el stausCode es diferente a 200');
  }

  final data = jsonDecode(response.data) as Map;

  final products = data['products'] as List;

  // Transformar en listado
  result = products.map((e) {
    return ProductEntity(
        id: int.parse(e['id'].toString()),
        pathNetworkImage: e['image'],
        title: e['name'],
        price: double.parse(e['unit_price'].toString()),
        stock: int.parse(e['stock'].toString()),
        unitCartList: 0);
  }).toList();

  return (GeneralRequestType.success, result);
}
