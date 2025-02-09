import 'package:lego_express/domain/domain.dart';

abstract class DbRepository {
  /// Inicializar la base de tados.
  Future initDb();

  /// Obtiene todos los usuarios
  Future<List<UserDbEntity>> getAllUsers();

  /// Almacena un usuario
  Future<bool> saveUser(LogInEntity logInEntity);

  /// Elimina todos los usuarios
  Future<bool> deleteAllUsers();
}
