import 'package:lego_express/domain/domain.dart';

/// Entidad que representa un producto en el carrito
class ProductCartEntity {
  // Información base
  ProductEntity productEntityInformation;
  // Unidades seleccionadas
  int unitsSelected;

  ProductCartEntity(
      {required this.productEntityInformation, required this.unitsSelected});
}
