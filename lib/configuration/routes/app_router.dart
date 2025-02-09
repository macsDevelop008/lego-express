import 'package:go_router/go_router.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Router de la aplicación.
final appRouter = GoRouter(
    // ruta inicial.
    initialLocation: ProductDetailScreen.route,
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
        builder: (context, state) => ProductDetailScreen(
          productEntity: ProductEntity(
              pathNetworkImage:
                  'https://www.lego.com/cdn/cs/set/assets/blt841ff4b13275f885/854032.jpg',
              title: 'Llavero de Nueva York',
              description:
                  '¡Los fans de la Gran Manzana van a adorar el Llavero de Nueva York LEGO® Iconic (854032)! Cuenta con una minifigura ataviada con una gorra de béisbol y una camiseta con las palabras “New York” impresas, unida a una resistente anilla con una cadena metálica. Una manera perfecta de tener las llaves a mano y localizadas, o de añadir un llamativo toque de estilo neoyorquino a una mochila, una fiambrera o lo que se te ocurra.',
              price: 250,
              stock: 6),
        ),
      ),
    ]);
