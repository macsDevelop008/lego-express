import 'package:go_router/go_router.dart';
import 'package:lego_express/presentation/presentation.dart';

/*
 Color _backgroundColorTextField() {
    return widget.appTheme.elevatedButtonTheme.style!.backgroundColor!
        .resolve(<WidgetState>{})!.withValues(alpha: 0.13);
  }
 */
/// Router de la aplicación.
final appRouter = GoRouter(
    // ruta inicial.
    initialLocation: ShoppingScreen.route,
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
      // Ruta de la pantalla principal de productos.
      GoRoute(
        path: ShoppingScreen.route,
        name: ShoppingScreen.name,
        builder: (context, state) => const ShoppingScreen(),
      ),
    ]);
