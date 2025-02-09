import 'package:flutter/material.dart';
import 'package:lego_express/configuration/configuration.dart';

class GlobalTextFieldWidget extends StatefulWidget {
  const GlobalTextFieldWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.backgroundColor,
      required this.borderRadiusValue,
      required this.controller,
      this.isObscureText,
      this.fontSize,
      this.hintText,
      this.horizontalPadding,
      this.iconSize,
      this.icon,
      this.useShadow,
      this.shadowColor});

  // Ancho del widget.
  final double width;
  // Alto del widget.
  final double height;
  // Valor de los bordes redondeados
  final double borderRadiusValue;
  // Color de fondo.
  final Color backgroundColor;
  // Controlador
  final TextEditingController controller;
  // Es o no texto que se puede ocultar como la contraseña.
  final bool? isObscureText;
  // Tamaño del texto.
  final double? fontSize;
  // Texto guia.
  final String? hintText;
  // Padding horizontal.
  final double? horizontalPadding;
  // Icono principal.
  final IconData? icon;
  // Tamaño del icono.
  final double? iconSize;
  // Usar sombra
  final bool? useShadow;
  // Color de la sombra
  final Color? shadowColor;

  @override
  State<GlobalTextFieldWidget> createState() => _GlobalTextFieldWidgetState();
}

class _GlobalTextFieldWidgetState extends State<GlobalTextFieldWidget> {
  // Variable para calcular si se muestra o no el texto.
  late bool _showText;

  @override
  void initState() {
    // Se inicializa variable, por defecto es falsa.
    _showText = widget.isObscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius:
              BorderRadius.all(Radius.circular(widget.borderRadiusValue)),
          boxShadow: (widget.useShadow != null && widget.useShadow!)
              ? [
                  BoxShadow(
                      color: widget.shadowColor!,
                      blurRadius: widget.height * 0.06,
                      spreadRadius: widget.height * 0.01)
                ]
              : null),
      child: TextField(
          controller: widget.controller,
          textAlign: TextAlign.left, // Centrado en X
          textAlignVertical: TextAlignVertical.center, // Centrado en Y
          obscureText: _isObscureText() && _showText, // Ocultar texto
          style: TextStyle(
              fontSize: widget.fontSize ?? widget.height * 0.4,
              color: AppColors(context: context).sixth),
          decoration: InputDecoration(
              border: InputBorder.none, // Eliminar border inferior.
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding ?? widget.width * 0.15,
              ), // Padding
              hintText: widget.hintText ?? '',
              prefixIcon: Icon(widget.icon ?? Icons.person,
                  size: widget.iconSize ?? widget.height * 0.4),
              suffixIcon: _suffixIcon(_isObscureText()))),
    );
  }

  /// Calcula el evento para el suffixIcon
  ///
  /// @param [showIcon] mostrar o no el icono
  /// @return El widget a dibujar o nulo según el parámetro de llegada.
  Widget? _suffixIcon(bool showIcon) {
    return showIcon
        ? IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              size: widget.iconSize ?? widget.height * 0.4,
            ),
            onPressed: () {
              _showText = !_showText;
              setState(() {});
            },
          )
        : null;
  }

  /// Calcula si el texto debe ser ocultado o no.
  ///
  /// @return El calculo basado en el parámetro [isObscureText]
  bool _isObscureText() {
    final result = widget.isObscureText != null && widget.isObscureText!;
    return result;
  }
}
