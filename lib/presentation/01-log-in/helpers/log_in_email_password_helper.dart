import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/infraestructure/driven-adapter/db/repositories/db_repository_impl.dart';
import 'package:lego_express/infraestructure/infraestructure.dart';
import 'package:lego_express/presentation/presentation.dart';

Future uiLogInEmailPasswordHelper(
    BuildContext context, String email, String password) async {
  // Validar email
  if (email != '') {
    if (password != '') {
      // Abrir dialog LogIn
      showLoadingDialog(context);
      // Delay
      await Future.delayed(Duration(seconds: 1));
      // Fuente de información
      final datasource = LogInFirebaseDatasourceImpl();
      final repository = LogInRepositoryImpl(datasource: datasource);
      // Ejecutar logIn
      final dataResult = await repository.logInEmailPassword(email, password);
      // Cerrar dialog loading
      closeDialog(context);
      // Si se generó un error
      if (dataResult.hasError) {
        showCustomDialog(
            context: context,
            type: DialogType.error,
            body: Text(
              dataResult.message ?? 'Error.',
              style: TextStyle(fontSize: 20),
            ),
            onPressOk: () {
              closeDialog(context);
            });
      }
      // Si se realizó el logIn
      else {
        // Almacenar usuario logueado
        await _saveUser();
        // Pasar a la vista principal de productos
      }
    } else {
      showCustomDialog(
          context: context,
          type: DialogType.error,
          body: Text(
            'Debes ingresar un la Contraseña.',
            style: TextStyle(fontSize: 20),
          ),
          onPressOk: () {
            closeDialog(context);
          });
    }
  } else {
    showCustomDialog(
        context: context,
        type: DialogType.error,
        body: Text(
          'Debes ingresar un Email.',
          style: TextStyle(fontSize: 20),
        ),
        onPressOk: () {
          closeDialog(context);
        });
  }
}

Future _saveUser() async {
  // Fuente de información
  final datasource = DbSqfliteDatasourceImpl();
  final repository = DbRepositoryImpl(datasource: datasource);

  await repository.initDb();
}
