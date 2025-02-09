import 'package:firebase_auth/firebase_auth.dart';

/// Entidad que contiene los datos resultantes del LogIn.
class LogInEntity {
  // Si fue error o no
  bool hasError;
  // Mensaje sobre la autenticación
  String? message;
  // Datos del usuario si logró loguear
  UserCredential? userLogueado;

  LogInEntity({required this.hasError, this.message, this.userLogueado});
}
