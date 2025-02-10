import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Clase con las variables de entorno.
class Enviroment {
  static final String urlBase =
      dotenv.get('URL_BASE', fallback: 'error-no-found');
}
