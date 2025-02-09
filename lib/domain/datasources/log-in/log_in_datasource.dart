import 'package:lego_express/domain/domain.dart';

abstract class LogInDatasource {
  /// LogIn por medio del email y la contraseña.
  ///
  /// @param [email] email ingresado.
  /// @param [password] contraseña ingresada.
  Future<LogInEntity> logInEmailPassword(String email, String password);

  /// LogOut del usuario
  Future logOut();
}
