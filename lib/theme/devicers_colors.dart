import 'package:material_ui/material_ui.dart';

/// Paleta de Devicers en modo oscuro, copiada de `Color.kt` de la app Android.
///
/// Reúne en un solo lugar los hexadecimales que antes se repetirían en cada pantalla.
/// Se usa el modo oscuro porque es el que muestran las capturas de referencia del proyecto.
class DevicersColors {
  /// Burgundy de acción para botones principales y bordes enfocados.
  static const Color primary = Color(0xFF770002);

  /// Acento de texto; sobre fondo oscuro el burgundy se aclara a rosa para ser legible.
  static const Color primaryText = Color(0xFFD98E91);

  /// Fondo de las opciones seleccionadas, como los chips activos.
  static const Color selection = Color(0xFFD98E91);

  /// Texto sobre una opción seleccionada.
  static const Color textOnSelection = Color(0xFF211D1B);

  /// Fondo general de las pantallas.
  static const Color background = Color(0xFF1C1817);

  /// Superficie elevada de campos, botones secundarios y barra de navegación.
  static const Color surface = Color(0xFF32241C);

  /// Superficie de contenedores anidados, como el panel de filtros.
  static const Color surfaceSecondary = Color(0xFF271B15);

  /// Texto principal.
  static const Color textPrimary = Color(0xFFF6EEE8);

  /// Texto secundario, de ejemplo y etiquetas discretas.
  static const Color textSecondary = Color(0xFFBCAFA9);

  /// Texto sobre el color de acción.
  static const Color textOnPrimary = Color(0xFFF6EEE8);

  /// Bordes de campos, chips y botones secundarios.
  static const Color border = Color(0xFF423B37);

  /// Dorado reservado para las calificaciones.
  static const Color rating = Color(0xFFE1B55C);

  /// Sombra de los contenedores que flotan sobre el fondo.
  static const Color shadow = Color(0x66000000);
}
