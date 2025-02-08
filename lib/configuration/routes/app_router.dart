import 'package:go_router/go_router.dart';
import 'package:logo_express/presentation/presentation.dart';

/// Router de la aplicación.
final appRouter = GoRouter(
    // ruta inicial.
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const InitialScreen(),
      ),
    ]);
