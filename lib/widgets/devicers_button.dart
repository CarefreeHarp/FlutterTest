import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:material_ui/material_ui.dart';

/// Botón relleno de ancho completo que comparten las pantallas de Devicers.
///
/// Por defecto es el botón burgundy de acción principal ("Crear cuenta", "Buscar"). El texto,
/// la altura, el estilo y los colores llegan por constructor para reutilizarlo también en
/// el selector Users / Products en lugar de duplicar el código del botón.
class DevicersButton extends StatelessWidget {
  /// Texto mostrado dentro del botón.
  final String text;

  /// Altura del botón; el ancho siempre ocupa todo el espacio disponible.
  final double height;

  /// Estilo del texto; el color lo pone [foregroundColor].
  final TextStyle textStyle;

  /// Color de fondo del botón.
  final Color backgroundColor;

  /// Color del texto del botón.
  final Color foregroundColor;

  const DevicersButton({
    super.key,
    required this.text,
    this.height = 52,
    this.textStyle = DevicersTextStyles.authenticationButton,
    this.backgroundColor = DevicersColors.primary,
    this.foregroundColor = DevicersColors.textOnPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: FilledButton(
        // Sin navegación ni estado todavía, el botón no ejecuta ninguna acción.
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
