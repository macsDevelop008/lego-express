import 'dart:convert';

import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';

Future<(GeneralRequestType, ProductEntity?)> searchProductByIdHelper(
    int id, String endPointUrl) async {
  // Dio singleton
  final dio = await RequestDioSingletonHelper.shared.instace;

  // Peticion
  final response = await dio.get('$endPointUrl/$id');

  // Tratamiento de error
  if (response.statusCode != 200) {
    throw ('Error, el stausCode es diferente a 200');
  }

  final data = jsonDecode(response.data) as Map;

  final productResult = ProductEntity(
      id: -1,
      pathNetworkImage: data['image'],
      title: data['name'].toString(),
      price: double.parse(data['unit_price'].toString()),
      stock: int.parse(data['stock'].toString()),
      description: data['description'],
      unitCartList: -1);

  return (GeneralRequestType.success, productResult);
}
