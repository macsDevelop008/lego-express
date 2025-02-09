import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lego_express/presentation/presentation.dart';

void main() async {
  // Inicializar Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Inicializar las variables de entorno.
  await dotenv.load(fileName: ".env");
  // Ejecutar la aplicación.
  runApp(const MyApp());
}
