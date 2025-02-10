import 'package:lego_express/configuration/enums/general_request_type_enum.dart';
import 'package:lego_express/domain/domain.dart';

class RequestTestDatasourceImpl implements RequestDatasource {
  @override
  Future<(GeneralRequestType, List<ProductEntity>?)> buyProdycts() {
    // TODO: implement buyProdycts
    throw UnimplementedError();
  }

  @override
  Future<(GeneralRequestType, List<ProductEntity>)> getAllProducts() async {
    return (
      GeneralRequestType.success,
      [
        ProductEntity(
            id: 1,
            pathNetworkImage:
                'https://www.lego.com/cdn/cs/set/assets/blt742e8599eb5e8931/40649.png?fit=bounds&format=jpg&quality=80&width=1500&height=1500&dpr=1',
            title: 'Titlo 456',
            price: 200,
            stock: 4,
            unitCartList: 0),
        ProductEntity(
            id: 2,
            pathNetworkImage:
                'https://www.lego.com/cdn/cs/set/assets/blt742e8599eb5e8931/40649.png?fit=bounds&format=jpg&quality=80&width=1500&height=1500&dpr=1',
            title: 'Titulo 1',
            price: 400,
            stock: 4,
            unitCartList: 0),
        ProductEntity(
            id: 3,
            pathNetworkImage:
                'https://www.lego.com/cdn/cs/set/assets/blt742e8599eb5e8931/40649.png?fit=bounds&format=jpg&quality=80&width=1500&height=1500&dpr=1',
            title: 'Titulo 165',
            price: 140,
            stock: 4,
            unitCartList: 0),
      ]
    );
  }

  @override
  Future<(GeneralRequestType, ProductEntity?)> searchProductById(int id) async {
    return (
      GeneralRequestType.success,
      ProductEntity(
          id: 3,
          pathNetworkImage:
              'https://www.lego.com/cdn/cs/set/assets/blt742e8599eb5e8931/40649.png?fit=bounds&format=jpg&quality=80&width=1500&height=1500&dpr=1',
          title: 'Titulo 165',
          price: 140,
          stock: 4,
          description:
              'Reprehenderit aliqua voluptate duis exercitation irure exercitation sunt ipsum ullamco pariatur voluptate do culpa ea. Nisi duis do deserunt ex est fugiat. Ea minim incididunt do aliquip quis exercitation ut. Esse reprehenderit ut esse nisi cillum do proident id eiusmod. Aute consectetur non qui excepteur cupidatat cillum magna incididunt cupidatat irure tempor veniam voluptate. Excepteur laborum magna quis laborum minim. Quis aliquip esse qui aute irure consequat commodo reprehenderit quis elit nisi voluptate deserunt.',
          unitCartList: 0)
    );
  }
}
