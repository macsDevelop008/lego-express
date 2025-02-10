import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/domain/domain.dart';

/// Provider del listado de productos en el carrito.
///
/// @return el listado de productos.
final shoppingCartProductsProvider = StateProvider<List<ProductEntity>>((ref) {
  return [];
});
