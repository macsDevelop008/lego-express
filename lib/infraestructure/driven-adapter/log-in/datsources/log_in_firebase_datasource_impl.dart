import 'package:firebase_auth/firebase_auth.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';
import 'package:logger/logger.dart';

class LogInFirebaseDatasourceImpl implements LogInDatasource {
  /// LogIn firebase
  @override
  Future<LogInEntity> logInEmailPassword(String email, String password) async {
    try {
      return await logInEmailPasswordHelper(email, password);
    }
    // Errores Firebase
    on FirebaseAuthException catch (e) {
      String message = '';
      switch (e.code) {
        case 'invalid-email':
          message = 'No se encontró un usuario con ese email.';
          break;
        case 'invalid-credential':
          message = 'La contraseña es incorrecta.';
          break;

        default:
          message = e.message ?? 'Ocurrió un error al iniciar sesión.';
      }
      Logger().e('Error al autenticar con email y contraseña: ${e.code}');
      return LogInEntity(hasError: true, message: message);
    }
    // Error no esperado
    catch (e) {
      Logger().e('Error al autenticar con email y contraseña: $e');
      return LogInEntity(
          hasError: true, message: 'Ha ocurrido un error inseperado.');
    }
  }

  @override
  Future logOut() async {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
