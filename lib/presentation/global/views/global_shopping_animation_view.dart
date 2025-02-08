import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Widget que muestra la animación de compras.
class GlobalShoppingAnimationView extends StatelessWidget {
  const GlobalShoppingAnimationView({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child:
            Lottie.asset('assets/animations/lottie/Animation-shopping.json'));
  }
}
