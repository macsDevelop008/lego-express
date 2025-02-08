import 'package:go_router/go_router.dart';
import 'package:logo_express/presentation/presentation.dart';

/// Router de la aplicación.
final appRouter = GoRouter(
    // ruta inicial.
    initialLocation: LogInScreen.route,
    routes: [
      // Ruta de la pantalla inicial.
      GoRoute(
        path: InitialScreen.route,
        name: InitialScreen.name,
        builder: (context, state) => const InitialScreen(),
      ),
      // Ruta de la pantalla de inicio de sesión.
      GoRoute(
        path: LogInScreen.route,
        name: LogInScreen.name,
        builder: (context, state) => const LogInScreen(),
      ),
    ]);
