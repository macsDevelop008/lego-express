import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/domain/domain.dart';

/// Provider del listado de productos.
///
/// @return el listado de productos.
final listAllProductsProvider =
    StateNotifierProvider<ProductListNotifier, List<ProductEntity>>(
  (ref) => ProductListNotifier(),
);

class ProductListNotifier extends StateNotifier<List<ProductEntity>> {
  // Valor inicial, lista vacia
  ProductListNotifier() : super([]);

  // Nuevo listado
  void newList(List<ProductEntity> list) {
    state = list;
  }

  // Agregar un producto a la lista
  void addProduct(ProductEntity product) {
    state = [...state, product];
  }

  // Eliminar un producto de la lista por su id
  void removeProduct(int id) {
    state = state.where((product) => product.id != id).toList();
  }

  // Actualiza un producto existente. Se busca por id
  void updateProduct(ProductEntity updatedProduct) {
    state = state.map((product) {
      return product.id == updatedProduct.id ? updatedProduct : product;
    }).toList();
  }
}
