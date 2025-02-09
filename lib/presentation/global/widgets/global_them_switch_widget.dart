import 'package:flutter/material.dart';

/// Widget que muestra un switch con iconos para representar el tema claro y oscuro
class GlobalThemeSwitchWidget extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  const GlobalThemeSwitchWidget({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Ícono que representa el tema claro
        const Icon(Icons.wb_sunny, color: Colors.amber),
        // El switch que alterna entre los temas
        Switch(
          value: isDarkMode,
          onChanged: onChanged,
        ),
        // Ícono que representa el tema oscuro
        const Icon(Icons.nightlight_round, color: Colors.indigo),
      ],
    );
  }
}
