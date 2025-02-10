import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/domain/domain.dart';

class RequestRepositoryImpl implements RequestRepository {
  final RequestDatasource datasource;

  RequestRepositoryImpl({required this.datasource});

  @override
  Future<(GeneralRequestType, List<ProductEntity>?)> buyProdycts() async {
    return await datasource.buyProdycts();
  }

  @override
  Future<(GeneralRequestType, List<ProductEntity>)> getAllProducts() async {
    return await datasource.getAllProducts();
  }

  @override
  Future<(GeneralRequestType, ProductEntity?)> searchProductById(int id) async {
    return await datasource.searchProductById(id);
  }
}
