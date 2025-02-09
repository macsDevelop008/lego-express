import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/infraestructure/driven-adapter/db/repositories/db_repository_impl.dart';
import 'package:lego_express/presentation/presentation.dart';

Future initialDataHelper(BuildContext context) async {
  // Delay
  await Future.delayed(Duration(seconds: 2));

  // Verificar si existe un usuario en la DB
  final datasource = DbSqfliteDatasourceImpl();
  final repository = DbRepositoryImpl(datasource: datasource);
  await repository.initDb();

  final users = await repository.getAllUsers();

  // Si no existe ir al LogIn
  if (users.isEmpty) {
    context.go(LogInScreen.route);
  }
  // Si existe ir a la vista principal de la tienda
  else {
    context.go(ShoppingScreen.route);
  }
}
