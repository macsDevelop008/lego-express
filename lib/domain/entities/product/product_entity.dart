/// Entidad que representa un producto
class ProductEntity {
  // Url de la imagen.
  String pathNetworkImage;
  // Titulo o nombre.
  String title;
  // Descripción.
  String description;
  // Precio.
  double price;
  // Cantidad disponible
  int stock;

  ProductEntity(
      {required this.pathNetworkImage,
      required this.title,
      required this.description,
      required this.price,
      required this.stock});
}
