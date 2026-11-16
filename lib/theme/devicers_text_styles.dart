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

  // Los estilos siguientes fijan `height` (interlineado / tamaño) para reproducir el
  // `lineHeight` de Android; sin él, Flutter usa el interlineado propio de la fuente.

  /// Pestañas del encabezado de Home: `SearchHeadingText` de Android con su interlineado.
  static const TextStyle homeTab = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 17.28,
    height: 23.76 / 17.28,
    fontWeight: FontWeight.w700,
  );

  /// Equivale a `MaterialTheme.typography.titleMedium`, como el nombre del producto en el feed.
  static const TextStyle titleMedium = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 19.44,
    height: 25.92 / 19.44,
    fontWeight: FontWeight.w600,
  );

  /// Equivale a `MaterialTheme.typography.titleSmall`, como el autor y el título de una reseña.
  static const TextStyle titleSmall = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 17.28,
    height: 21.6 / 17.28,
    fontWeight: FontWeight.w600,
  );

  /// Equivale a `MaterialTheme.typography.bodySmall`, como la antigüedad y la marca de una reseña.
  static const TextStyle bodySmall = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 12.96,
    height: 17.28 / 12.96,
    fontWeight: FontWeight.w400,
  );

  /// Equivale a `MaterialTheme.typography.labelLarge`, como el botón "Ver más".
  static const TextStyle labelLarge = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 15.12,
    height: 21.6 / 15.12,
    fontWeight: FontWeight.w600,
  );

  /// Cuerpo de las tarjetas de reseña (`ReviewContentText`).
  static const TextStyle reviewContent = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 16.28,
    height: 23.76 / 16.28,
    fontWeight: FontWeight.w400,
  );

  /// Conteos de interacción del feed (`FeedReviewActionCountText`).
  static const TextStyle feedReviewActionCount = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 16.848,
    height: 22.464 / 16.848,
    fontWeight: FontWeight.w700,
  );

  /// Estrellas grandes de calificación (`RatingStarsLargeText`).
  ///
  /// No declara familia a propósito: Plus Jakarta Sans no incluye ★ y se resuelve con la
  /// tipografía del sistema, igual que en Android.
  static const TextStyle ratingStarsLarge = TextStyle(
    letterSpacing: 0,
    fontSize: 19.44,
    height: 25.92 / 19.44,
  );

  /// Etiquetas bajo los íconos de la barra de navegación.
  static const TextStyle navigationLabel = TextStyle(
    fontFamily: family,
    letterSpacing: 0,
    fontSize: 10.26,
    fontWeight: FontWeight.w500,
  );
}
