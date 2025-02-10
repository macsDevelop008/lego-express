import 'package:flutter/material.dart';

class GlobalImageNetworkLoadingWidget extends StatelessWidget {
  const GlobalImageNetworkLoadingWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.contain,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          // La imagen ya se ha cargado, se muestra el widget final.
          return child;
        } else {
          // La imagen se está cargando.
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
