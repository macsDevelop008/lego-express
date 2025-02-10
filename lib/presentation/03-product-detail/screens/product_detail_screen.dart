import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lego_express/domain/domain.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Pantalla detalle de producto.
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productEntity});

  /// Nombre y ruta de la pantalla.
  static const String name = 'product-detail-screen';
  static const String route = '/$name';

  final ProductEntity productEntity;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
      // AppBar
      appBar: ProductDetailAppBarView(
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
                    // Imagen del producto.
                    SizedBox(
                      height: height * 0.3,
                      width: height * 0.3,
                      child: GlobalImageNetworkLoadingWidget(
                        url: widget.productEntity.pathNetworkImage,
                      ),
                    ),
                    /*GlobalNetworkImageWidget(
                      size: height * 0.3,
                      urlImage: widget.productEntity.pathNetworkImage,
                    ),*/
                    Expanded(child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        // Dimensiones para el base curva.
                        final widthBase = constraints.maxWidth;
                        final heightBase = constraints.maxHeight;

                        // Dimensiones para los elementos.
                        final widthBaseData = widthBase;
                        final heightBaseData = heightBase * 0.8;
                        return // Base Curva.
                            Stack(
                          alignment: Alignment.center,
                          children: [
                            GlobalBaseCurveCustomWidget(
                              heightBase: heightBase,
                              widthBase: widthBase,
                              colorBase:
                                  theme.primaryColor.withValues(alpha: 0.75),
                            ),
                            Positioned(
                              bottom: 0,
                              // Petición del detalle del producto
                              child: FutureBuilder(
                                future: uiRequestDetailProductHelper(
                                    context, widget.productEntity),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    if (Platform.isIOS) {
                                      return CupertinoActivityIndicator(
                                        radius: heightBaseData * 0.13,
                                      );
                                    } else {
                                      return SizedBox(
                                          width: heightBaseData * 0.13,
                                          height: heightBaseData * 0.13,
                                          child: CircularProgressIndicator());
                                    }
                                  } else {
                                    return _dataSecondPart(
                                        heightBaseData,
                                        widthBaseData,
                                        theme,
                                        snapshot.data.toString());
                                  }
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Datos de la segunda parte, dentro del fondo curvo
  Container _dataSecondPart(double heightBaseData, double widthBaseData,
      ThemeData theme, String descrition) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red.withValues(alpha: 0),
      height: heightBaseData,
      width: widthBaseData,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthBaseData * 0.035),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Titulo
            ProductDetailTitleView(
              title: widget.productEntity.title,
              size: heightBaseData * 0.07,
            ),
            // Calificación
            ProductDetailExtraInformationView(
              iconCalificationSize: heightBaseData * 0.1,
              textCalification: '4.8',
              sizeTextCalification: heightBaseData * 0.055,
            ),
            // Descripción
            ProductDetailDescriptionView(
              height: heightBaseData * 0.28,
              width: widthBaseData,
              description: descrition,
              descriptionSize: heightBaseData * 0.04,
            ),
            // Precio y agregar cantidad
            ProductDetailPreciAddUnitView(
              height: heightBaseData * 0.25,
              width: widthBaseData,
              appTheme: theme,
              productEntity: widget.productEntity,
            ),
            // Botón agregar al carrito
            ProductDetailButtonAddToCartView(
              height: heightBaseData * 0.22,
              width: widthBaseData,
              productEntity: widget.productEntity,
            ),
          ],
        ),
      ),
    );
  }
}
