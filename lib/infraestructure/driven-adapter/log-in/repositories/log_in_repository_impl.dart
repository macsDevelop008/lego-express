import 'package:lego_express/domain/domain.dart';

class LogInRepositoryImpl implements LogInRepository {
  final LogInDatasource datasource;

  LogInRepositoryImpl({required this.datasource});

  @override
  Future<LogInEntity> logInEmailPassword(String email, String password) async {
    return await datasource.logInEmailPassword(email, password);
  }

  @override
  Future logOut() async {
    return await datasource.logOut();
  }
}
