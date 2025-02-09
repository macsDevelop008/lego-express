import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/infraestructure/driven-adapter/db/repositories/db_repository_impl.dart';
import 'package:lego_express/presentation/presentation.dart';

Future globalLogOutHelper(BuildContext context) async {
  // Mostrar dialog de confirmación
  showCustomDialog(
      context: context,
      type: DialogType.alert,
      barrierDismissible: true,
      body: Text(
        '¿Deseas cerrar sesión?',
        style: TextStyle(fontSize: 20),
      ),
      onPressOk: () async {
        await _confirmLogOut(context);
      },
      onPressCancel: () {
        closeDialog(context);
      });
}

Future _confirmLogOut(BuildContext context) async {
  // Cerrar modal de confirmación
  //closeDialog(context);
  // Cerrar modal de opciones
  //closeDialog(context);
  // Abrir modal de carga
  showLoadingDialog(context);
  // Delay
  await Future.delayed(Duration(seconds: 1));
  // Eliminar usuarios de la DB
  final datasource = DbSqfliteDatasourceImpl();
  final repository = DbRepositoryImpl(datasource: datasource);
  await repository.initDb();
  await repository.deleteAllUsers();
  await Future.delayed(Duration(seconds: 1));
  // Cerrar modal de carga
  closeDialog(context);
  // Volver a la vista de carga iniciar
  context.go(InitialScreen.route);
}
