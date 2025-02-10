import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  /// Nombre y ruta de la pantalla.
  static const String name = 'shopping-cart-screen';
  static const String route = '/$name';

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  // Dimensiones de la pantalla.
  late final double height;
  late final double width;

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
        appBar: ShoppingCartAppBarView(
          leadingPaddingLeft: width * 0.01,
          appTheme: theme,
        ),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (d, r) {
            debugPrint('Botón nativo capturado.');
          },
          child: SizedBox(
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
                  SafeArea(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Parte superior sin base
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        color: Colors.amber.withValues(alpha: 0),
                        width: width,
                        height: height * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Titulo
                            ShoppingCartTitleView(
                              title: 'Mi carrito',
                              titleSize: height * 0.035,
                            ),
                            // Listado Carrito
                            ShoppingCartListProductsView(
                              height: height * 0.37,
                              width: width,
                              theme: theme,
                            ),
                          ],
                        ),
                      ),
                      // Parte inferior base curvada
                      Expanded(child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          // Dimensiones
                          final widthBase = constraints.maxWidth;
                          final heightBase = constraints.maxHeight;

                          return Container(
                              color: Colors.blue.withValues(alpha: 0),
                              /*padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),*/
                              width: widthBase,
                              height: heightBase,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Base curvada de fondo
                                  GlobalBaseCurveCustomWidget(
                                      heightBase: heightBase,
                                      widthBase: widthBase,
                                      colorBase: theme.primaryColor
                                          .withValues(alpha: 0.7)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.05),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Subtotal, Descuento y Total
                                        ShoppingCartTotalAccountView(
                                          height: heightBase * 0.6,
                                          width: widthBase,
                                          appTheme: theme,
                                        ),

                                        // Botón pagar
                                        ShoppingCartButtonPayView(
                                          height: heightBase,
                                          width: widthBase,
                                          appTheme: theme,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ));
                        },
                      )),
                    ],
                  ))
                ],
              )),
        ));
  }
}
