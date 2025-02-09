import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Pantalla principal de productos.
class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  /// Nombre y ruta de la pantalla.
  static const String name = 'shopping-screen';
  static const String route = '/$name';

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  // Dimensiones de la pantalla.
  late double height;
  late double width;

  @override
  void initState() {
    super.initState();

    // Calculo inicial (unico) de las dimensiones de la pantalla.
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    height = view.physicalSize.height / view.devicePixelRatio;
    width = view.physicalSize.width / view.devicePixelRatio;
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el tema.
    final theme = Theme.of(context);

    return Scaffold(
      // Visible bajo el AppBar.
      extendBodyBehindAppBar: true,
      // App bar
      appBar: ShoppingAppBarView(
        leadingPaddingLeft: width * 0.02,
        appTheme: theme,
        actionProfileUserSize: width * 0.1,
      ),
      // Botón Global
      floatingActionButton: ShoppingFloatingActionButton(
        event: () {},
        icon: Icons.shopping_cart_checkout_rounded,
        iconColor: theme.primaryColor,
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Fondo de la pantalla.
            GlobalBackgroundBlurredColorView(
              height: height,
              width: width,
            ),
            // Scroll para los TextField.
            SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: SizedBox(
                  height: height,
                  child:
                      // Area segura para evitar el dibujado por debajo del appBar.
                      SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Titulo - Saludo.
                        ShoppingTitleView(
                          height: height * 0.1,
                          width: width,
                          marginTop: height * 0.03,
                          paddingLeft: width * 0.05,
                        ),
                        // TextField o barra de Busqueda.
                        ShoppingBarSearchView(
                          height: height * 0.075,
                          width: width,
                          appTheme: theme,
                        ),
                        // Listado horizontal de categorías.
                        ShoppingListCategoriesView(
                          height: height * 0.1,
                          width: width * 0.92,
                          topMargin: height * 0.005,
                          bottomMargin: 0,
                          appTheme: theme,
                        ),
                        // Grid de productos.
                        Expanded(child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            final x = constraints.maxWidth;
                            final y = constraints.maxHeight;

                            return ShoppingGridProductsView(
                              height: y,
                              width: x,
                              appTheme: theme,
                            );
                          },
                        )),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
