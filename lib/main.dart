import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logo_express/presentation/presentation.dart';

void main() async {
  // Cargar las variables de entorno.
  await dotenv.load(fileName: ".env");
  // Ejecutar la aplicación.
  runApp(const MyApp());
}
