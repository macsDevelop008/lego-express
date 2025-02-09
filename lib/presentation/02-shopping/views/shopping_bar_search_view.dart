import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Vista barra de busqueda de productos.
class ShoppingBarSearchView extends StatefulWidget {
  const ShoppingBarSearchView(
      {super.key,
      required this.height,
      required this.width,
      required this.appTheme});

  // Alto de la vista.
  final double height;
  // Ancho de la vista.
  final double width;
  // Tema de la app.
  final ThemeData appTheme;

  @override
  State<ShoppingBarSearchView> createState() => _ShoppingBarSearchViewState();
}

class _ShoppingBarSearchViewState extends State<ShoppingBarSearchView> {
  // Controlador del TextField de busqueda.
  late TextEditingController controller;

  @override
  void initState() {
    // Incializar controlador.
    controller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.withValues(alpha: 0),
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      child: GlobalTextFieldWidget(
        width: widget.width * 0.9,
        height: widget.height * 0.8,
        hintText: 'Busqueda',
        fontSize: widget.height * 0.32,
        icon: Icons.search,
        backgroundColor: _backgroundColorTextField().withValues(alpha: 0.6),
        borderRadiusValue: widget.height * 0.2,
        controller: controller,
      ),
    );
  }

  Color _backgroundColorTextField() {
    return widget.appTheme.primaryColor;
  }
}
