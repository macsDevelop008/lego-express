import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';
import 'package:logger/logger.dart';

class RequestDioDatasourceImpl implements RequestDatasource {
  // EndPoint todos los productos
  final String endPointGetAllProducts = '/all-products';
  final String endPointSearchProducts = '/detail';

  @override
  Future<(GeneralRequestType, List<ProductEntity>?)> buyProdycts() async {
    try {} catch (e) {
      Logger().e('Error en la peticion para comprar productos: $e');
    }
    // TODO: implement buyProdycts
    throw UnimplementedError();
  }

  @override
  Future<(GeneralRequestType, List<ProductEntity>)> getAllProducts() async {
    List<ProductEntity> list = [];
    try {
      return await getAllProductsHelper(endPointGetAllProducts);
    } catch (e) {
      Logger().e('Error en la peticion para obtener los productos: $e');
      return (GeneralRequestType.error, list);
    }
  }

  @override
  Future<(GeneralRequestType, ProductEntity?)> searchProductById(int id) async {
    try {
      return await searchProductByIdHelper(id, endPointSearchProducts);
    } catch (e) {
      Logger().e('Error en la peticion para buscar un producto: $e');
      return (GeneralRequestType.error, null);
    }
  }
}
