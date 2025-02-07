import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logo_express/configuration/configuration.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Tema actual de la aplicación
    final theme = ref.watch(appThemeProvider);

    return
        // Manejo de estados - riverpod
        ProviderScope(
      child: MaterialApp.router(
        theme: theme,
        routerConfig: appRouter,
      ),
    );
  }
}
