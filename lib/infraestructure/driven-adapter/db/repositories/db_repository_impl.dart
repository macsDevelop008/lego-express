import 'package:lego_express/domain/entities/log-in/log_in_entity.dart';
import 'package:lego_express/domain/entities/user/user_entity.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';

class DbRepositoryImpl implements DbRepository {
  final DbDatasource datasource;

  DbRepositoryImpl({required this.datasource});

  @override
  Future<UserDbEntity> getUser(String uuid) async {
    return await datasource.getUser(uuid);
  }

  @override
  Future initDb() async {
    return await datasource.initDb();
  }

  @override
  Future<bool> deleteUser(int dbId) async {
    return await datasource.deleteUser(dbId);
  }

  @override
  Future<bool> saveUser(LogInEntity logInEntity) async {
    return await datasource.saveUser(logInEntity);
  }
}
