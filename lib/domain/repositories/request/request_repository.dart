import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';

abstract class RequestRepository {
  /// Consultar todos los productos
  Future<(GeneralRequestType, List<ProductEntity>)> getAllProducts();

  /// Consultar detalle de producto
  Future<(GeneralRequestType, ProductEntity?)> searchProductById(int id);

  /// Comprar producto
  Future<(GeneralRequestType, List<ProductEntity>?)> buyProdycts();
}
