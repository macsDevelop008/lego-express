import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';

/// Aplicación principal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Manejo de estados - riverpod
        ProviderScope(
      child:
          // Aceso a los providers
          Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          // Tema actual de la aplicación
          final theme = ref.watch(appThemeProvider);

          return MaterialApp.router(
            theme: theme,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
