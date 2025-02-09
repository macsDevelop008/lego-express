import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lego_express/presentation/presentation.dart';

/// Vista de los Inputs y botones del formulario de inicio de sesión.
class LogInFormButtonsView extends StatefulWidget {
  const LogInFormButtonsView({
    super.key,
    required this.height,
    required this.width,
    required this.appTheme,
  });

  // Alto del espacio a ocupar.
  final double height;
  // Ancho del espacio a ocupar.
  final double width;
  // Tema de la aplicación.
  final ThemeData appTheme;

  @override
  State<LogInFormButtonsView> createState() => _LogInFormButtonsViewState();
}

class _LogInFormButtonsViewState extends State<LogInFormButtonsView> {
  // Controlador para el ingreso del email.
  late final TextEditingController userController;
  // Controlador para el ingreso de la contraseña.
  late final TextEditingController passwordController;

  @override
  void initState() {
    userController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Base o Background.
        Container(
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.appTheme.primaryColor.withValues(alpha: 0.7),
          borderRadius: _borderRadius()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Espacio
          SizedBox(
            height: widget.height * 0.07,
          ),
          // Titulo - Email
          LogInFormTitleTextWidget(
            text: 'Email',
            textSize: widget.height * 0.045,
            paddinfLeft: widget.height * 0.14,
            color: widget.appTheme.textTheme.bodyMedium!.color!
                .withValues(alpha: 0.5),
          ),
          // TextField para el ingreso del email.
          GlobalTextFieldWidget(
            width: widget.width * 0.8,
            height: widget.height * 0.11,
            backgroundColor: _backgroundColorTextField(),
            borderRadiusValue: widget.width * 0.04,
            controller: userController,
            hintText: 'Ingresa tu Email',
            isObscureText: false,
          ),
          // Espacio
          SizedBox(
            height: widget.height * 0.07,
          ),
          // Titulo - Contraseña
          LogInFormTitleTextWidget(
            text: 'Contraseña',
            textSize: widget.height * 0.045,
            paddinfLeft: widget.height * 0.14,
            color: widget.appTheme.textTheme.bodyMedium!.color!
                .withValues(alpha: 0.5),
          ),
          // TextField para el ingreso de la contraseña.
          GlobalTextFieldWidget(
            width: widget.width * 0.8,
            height: widget.height * 0.11,
            backgroundColor: _backgroundColorTextField(),
            borderRadiusValue: widget.width * 0.04,
            controller: passwordController,
            hintText: 'Ingresa tu contraseña',
            isObscureText: true,
            icon: Icons.lock,
          ),
          // Espacio
          SizedBox(
            height: widget.height * 0.05,
          ),
          // Botóno inicio de sesión
          GlobalButtonTextWidget(
            text: 'Iniciar Sesión',
            sizeText: widget.height * 0.05,
            width: widget.width * 0.7,
            height: widget.height * 0.11,
            roundedBorders: widget.height * 0.03,
            event: () {
              print('hola');
            },
          ),
          // Espacio
          SizedBox(
            height: widget.height * 0.05,
          ),
          // Botones de inicio de sesión social.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: widget.width * 0.06,
            children: [
              _buttonLogInSocial(() {}, 'assets/images/icons/icon_google.png',
                  widget.height * 0.006),
              // Si está en iOS.
              if (Platform.isIOS) ...[
                _buttonLogInSocial(() {}, 'assets/images/icons/icon_apple.png',
                    widget.height * 0.006)
              ],
              _buttonLogInSocial(() {}, 'assets/images/icons/icon_facebook.png',
                  widget.height * 0.006),
            ],
          )
          // Inicio Sesión apple
        ],
      ),
    );
  }

  /// Botón para inicio de sesión con red social.
  ///
  /// @param [event] evento del botón.
  /// @param [routeImage] ruta de la imagen.
  /// @param [imageScale] tamaño de la imagen.
  /// @return Widget botón.
  GlobalButtonImageWidget _buttonLogInSocial(
      VoidCallback event, String routeImage, double imageScale) {
    return GlobalButtonImageWidget(
      width: widget.width * 0.15,
      height: widget.width * 0.15,
      roundedBorders: widget.width * 0.05,
      image: Transform.scale(
        scale: imageScale,
        child: Image.asset(
          routeImage,
        ),
      ),
      color: _backgroundColorTextField().withValues(alpha: 0.06),
      event: event,
    );
  }

  /// Obtiene el color para el TextField.
  ///
  /// @return El color base o de fondo del ElevationButton según el Theme.
  Color _backgroundColorTextField() {
    return widget.appTheme.elevatedButtonTheme.style!.backgroundColor!
        .resolve(<WidgetState>{})!.withValues(alpha: 0.13);
  }

  /// Calcula el borde redondeado de la base o Background.
  ///
  /// @return El BorderRadius para aplicaar
  BorderRadius _borderRadius() =>
      BorderRadius.vertical(top: Radius.circular(widget.width * 0.13));
}
