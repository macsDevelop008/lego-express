import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lego_express/configuration/configuration.dart';
import 'package:lego_express/presentation/presentation.dart';

class ShoppingLogOutChangeThemeView extends StatelessWidget {
  const ShoppingLogOutChangeThemeView(
      {super.key, required this.width, required this.height});

  // Dimensiones
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Cambiar tema.
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final themeProvider = ref.watch(appThemeProvider);

              return GlobalThemeSwitchWidget(
                isDarkMode: themeProvider == appThemeDark,
                onChanged: (bool value) {
                  // Cerrar modal
                  //closeDialog(context: context);
                  // Actulizar provider
                  var provider = ref.watch(appThemeProvider.notifier);
                  // Tema Light seleccionado
                  if (!value) {
                    provider.state = appThemeLight;
                  }
                  // Tema oscuro seleccionado
                  else {
                    provider.state = appThemeDark;
                  }
                },
              );
            },
          ),
          // Botón cerrar sesión
          GlobalButtonTextWidget(
              text: 'Cerrar Sesión', sizeText: height * 0.15, event: () {})
        ],
      ),
    );
  }
}
