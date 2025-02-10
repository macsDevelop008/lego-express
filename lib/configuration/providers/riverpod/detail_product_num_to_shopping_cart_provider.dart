import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider de la vista detalle de producto que almacena cuantos
/// items quedaron para almacenar en el carrito.
final detailProductUnitToCartProvider = StateProvider<int>((ref) {
  return 0;
});
