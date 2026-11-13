import 'package:material_ui/material_ui.dart';

/// Ícono PNG de un solo color teñido con el color indicado, como el `tint` de Android.
///
/// Se usa en lugar de `ImageIcon` porque, al probarlo en el emulador, `ImageIcon` dibujaba
/// una línea tenue en el borde de la imagen; aplicar el tinte con `ColorFiltered` la evita.
class TintedIcon extends StatelessWidget {
  /// Ruta del ícono dentro de `assets/images/`.
  final String path;

  /// Ancho y alto del ícono.
  final double size;

  /// Color con el que se pinta la silueta del ícono.
  final Color color;

  const TintedIcon({
    super.key,
    required this.path,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      // srcIn conserva la forma del PNG y reemplaza su color por el indicado.
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      child: Image.asset(path, width: size, height: size),
    );
  }
}
