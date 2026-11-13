import 'package:material_ui/material_ui.dart';

/// Escala tipográfica compartida de Devicers, copiada de `Type.kt` de la app Android.
///
/// Los estilos no fijan color: cada widget lo aplica con `copyWith`, igual que en Android,
/// donde el mismo estilo se pinta con distintos colores según el contexto.
/// Cada estilo declara la familia Plus Jakarta Sans, como `DevicersFontFamily` en Android.
///
/// Todos fijan `letterSpacing: 0` porque el tema de Material añade espaciado entre letras
/// que la app Android no tiene y que ensancharía textos y chips.
class DevicersTextStyles {
  /// Nombre de la familia declarada en la sección `fonts` de `pubspec.yaml`.
  static const String family = 'PlusJakartaSans';

  /// Título de las pantallas de autenticación, como "Crea tu cuenta".
  static const TextStyle authenticationTitle = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 24.84,
    fontWeight: FontWeight.w700,
  );

  /// Descripción de apoyo bajo el título de autenticación.
  static const TextStyle authenticationDescription = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 16.2,
  );

  /// Etiqueta que encabeza cada campo de autenticación.
  static const TextStyle authenticationFieldLabel = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 14.04,
    fontWeight: FontWeight.w500,
  );

  /// Enlaces y textos auxiliares de autenticación.
  static const TextStyle authenticationSupport = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 14.04,
  );

  /// Texto de los botones de acción principal de autenticación.
  static const TextStyle authenticationButton = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 15.12,
    fontWeight: FontWeight.w700,
  );

  /// Texto que la persona escribe dentro de un campo de autenticación.
  static const TextStyle fieldInput = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 17.28,
  );

  /// Texto de ejemplo de los campos de autenticación.
  static const TextStyle fieldHint = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 12.96,
  );

  /// Título grande que encabeza una pantalla, como "Buscar producto".
  static const TextStyle screenTitle = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 25.92,
    fontWeight: FontWeight.w700,
  );

  /// Títulos del panel de búsqueda, como "Filtros".
  static const TextStyle searchHeading = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 17.28,
    fontWeight: FontWeight.w700,
  );

  /// Etiquetas, campos y acciones secundarias del panel de búsqueda.
  static const TextStyle searchControl = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 12.96,
    fontWeight: FontWeight.w500,
  );

  /// Etiquetas bajo los íconos de la barra de navegación.
  static const TextStyle navigationLabel = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 10.26,
    fontWeight: FontWeight.w500,
  );
}
