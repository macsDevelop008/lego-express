import 'package:go_router/go_router.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Router de la aplicación.
final appRouter = GoRouter(
    // ruta inicial.
    initialLocation: InitialScreen.route,
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
      // Ruta de la pantalla detalle de productos.
      GoRoute(
        path: ProductDetailScreen.route,
        name: ProductDetailScreen.name,
        builder: (context, state) {
          final product = state.extra as ProductEntity;
          return ProductDetailScreen(productEntity: product);
        },
      ),
      // Ruta de la pantalla carrito de compras.
      GoRoute(
        path: ShoppingCartScreen.route,
        name: ShoppingCartScreen.name,
        builder: (context, state) => const ShoppingCartScreen(),
      ),
    ]);
