import 'package:lego_express/domain/entities/log-in/log_in_entity.dart';
import 'package:lego_express/domain/entities/user/user_entity.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

class DbSqfliteDatasourceImpl implements DbDatasource {
  late Database db;

  @override
  Future<bool> deleteUser(int dbId) async {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserDbEntity> getUser(String uuid) async {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> initDb() async {
    try {
      db = await InitSqfliteDbSingletonHelper.db.database;
      return true;
    } catch (e) {
      Logger().e('Error al iniciar la DB: $e');
      return false;
    }
  }

  @override
  Future<bool> saveUser(LogInEntity logInEntity) async {
    try {
      final uuid = logInEntity.userLogueado!.user!.uid;
      await db.insert('users', {'uuid': uuid});
      return true;
    } catch (e) {
      Logger().e('Error al guardar un usuario en la DB: $e');
      return false;
    }
  }
}
