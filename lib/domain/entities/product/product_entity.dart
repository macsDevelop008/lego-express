class ProductEntity {
  // id del producto según el back
  final int id;
  // URL de la imagen.
  final String pathNetworkImage;
  // Título o nombre.
  final String title;
  // Descripción (opcional).
  final String? description;
  // Precio.
  final double price;
  // Cantidad disponible en stock.
  final int stock;
  // Cantidad en el carrito de compras.
  final int unitCartList;

  ProductEntity({
    required this.id,
    required this.pathNetworkImage,
    required this.title,
    this.description,
    required this.price,
    required this.stock,
    required this.unitCartList,
  });

  /// Crea una copia de este objeto con valores opcionales modificados.
  ProductEntity copyWith({
    int? id,
    String? pathNetworkImage,
    String? title,
    String? description,
    double? price,
    int? stock,
    int? unitCartList,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      pathNetworkImage: pathNetworkImage ?? this.pathNetworkImage,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      unitCartList: unitCartList ?? this.unitCartList,
    );
  }
}
