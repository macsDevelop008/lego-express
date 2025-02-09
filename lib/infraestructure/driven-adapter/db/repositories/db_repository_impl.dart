import 'package:lego_express/domain/entities/log-in/log_in_entity.dart';
import 'package:lego_express/domain/entities/user/user_entity.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';

class DbRepositoryImpl implements DbRepository {
  final DbDatasource datasource;

  DbRepositoryImpl({required this.datasource});

  @override
  Future initDb() async {
    return await datasource.initDb();
  }

  @override
  Future<bool> saveUser(LogInEntity logInEntity) async {
    return await datasource.saveUser(logInEntity);
  }

  @override
  Future<bool> deleteAllUsers() async {
    return await datasource.deleteAllUsers();
  }

  @override
  Future<List<UserDbEntity>> getAllUsers() async {
    return await datasource.getAllUsers();
  }
}
