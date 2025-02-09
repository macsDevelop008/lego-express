import 'package:lego_express/domain/domain.dart';

abstract class DbDatasource {
  /// Inicializar la base de tados.
  Future initDb();

  /// Obtiene un usuario por uuid de firebase
  Future<UserDbEntity> getUser(String uuid);

  /// Almacena un usuario
  Future<bool> saveUser(LogInEntity logInEntity);

  /// Elimina un usuario por id
  Future<bool> deleteUser(int dbId);
}
