import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:flutter_app/widgets/tinted_icon.dart';
import 'package:material_ui/material_ui.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DevicersColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _MapTopHeader(),
            Expanded(
              child: Stack(
                children: [
                  // 1. Imagen estática del mapa de Bogotá ocupando todo el lienzo
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: DevicersColors.surfaceSecondary,
                        alignment: Alignment.center,
                        child: Text(
                          'Falta añadir assets/images/map.png',
                          style: DevicersTextStyles.searchControl.copyWith(
                            color: DevicersColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 2. Marcadores quemados replicando exactamente la captura de Android
                  // Clúster izquierdo con el logo de Devicers y badge "25"
                  const Positioned(
                    top: 330,
                    left: 14,
                    child: _ClusterMarker(count: 25),
                  ),
                  // Marcador superior central (Auriculares)
                  const Positioned(
                    top: 215,
                    left: 148,
                    child: _CategoryPinMarker(icon: Icons.headphones),
                  ),
                  // Marcador central (Celular)
                  const Positioned(
                    top: 380,
                    left: 142,
                    child: _CategoryPinMarker(icon: Icons.phone_android),
                  ),
                  // Marcador borde derecho (Celular)
                  const Positioned(
                    top: 230,
                    right: -8,
                    child: _CategoryPinMarker(icon: Icons.phone_android),
                  ),
                  // Marcador borde inferior izquierdo (Portátil)
                  const Positioned(
                    bottom: -10,
                    left: 108,
                    child: _CategoryPinMarker(icon: Icons.laptop),
                  ),

                  // 3. Los 4 botones circulares en las esquinas del mapa
                  // Esquina superior izquierda: Filtros
                  const Positioned(
                    top: 16,
                    left: 16,
                    child: _MapCornerButton(
                      size: 48,
                      child: Icon(
                        Icons.filter_list,
                        color: DevicersColors.textOnPrimary,
                        size: 24,
                      ),
                    ),
                  ),
                  // Esquina superior derecha: Brújula / Norte
                  const Positioned(
                    top: 16,
                    right: 16,
                    child: _MapCornerButton(
                      size: 48,
                      child: TintedIcon(
                        path: 'assets/images/north_icon.png',
                        size: 24,
                        color: DevicersColors.textOnPrimary,
                      ),
                    ),
                  ),
                  // Esquina inferior izquierda: Capas / Satélite
                  const Positioned(
                    bottom: 24,
                    left: 16,
                    child: _MapCornerButton(
                      size: 64,
                      child: TintedIcon(
                        path: 'assets/images/layers_icon.png',
                        size: 30,
                        color: DevicersColors.textOnPrimary,
                      ),
                    ),
                  ),
                  // Esquina inferior derecha: Centrar ubicación
                  const Positioned(
                    bottom: 24,
                    right: 16,
                    child: _MapCornerButton(
                      size: 64,
                      child: TintedIcon(
                        path: 'assets/images/centermap_icon.png',
                        size: 30,
                        color: DevicersColors.textOnPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Barra superior minimalista con la flecha de volver y el título "Mapa".
class _MapTopHeader extends StatelessWidget {
  const _MapTopHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: DevicersColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: DevicersColors.textPrimary,
          ),
          const SizedBox(width: 16),
          Text(
            'Mapa',
            style: DevicersTextStyles.searchHeading.copyWith(
              color: DevicersColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Botón circular flotante de las esquinas del mapa.
class _MapCornerButton extends StatelessWidget {
  final double size;
  final Widget child;

  const _MapCornerButton({required this.size, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: DevicersColors.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: DevicersColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

/// Marcador de clúster con punta inferior, logo de Devicers y contador numérico.
class _ClusterMarker extends StatelessWidget {
  final int count;

  const _ClusterMarker({required this.count});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 64,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              painter: _PinMarkerPainter(
                fillColor: DevicersColors.surface,
                borderColor: DevicersColors.primary,
                strokeWidth: 2.5,
              ),
              child: SizedBox(
                width: 46,
                height: 60,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: TintedIcon(
                      path: 'assets/images/logo_icono_oscuro.png',
                      size: 26,
                      color: DevicersColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: DevicersColors.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                count > 99 ? '99+' : '$count',
                style: const TextStyle(
                  color: DevicersColors.textOnPrimary,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Marcador individual por categoría con punta inferior (`MapMarkerShape`).
class _CategoryPinMarker extends StatelessWidget {
  final IconData icon;

  const _CategoryPinMarker({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PinMarkerPainter(
        fillColor: DevicersColors.surface,
        borderColor: DevicersColors.primary,
        strokeWidth: 2.0,
      ),
      child: SizedBox(
        width: 42,
        height: 54,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Icon(
              icon,
              size: 20,
              color: DevicersColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

/// Dibuja la silueta exacta de `MapMarkerShape` (círculo superior unido a punta inferior).
class _PinMarkerPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final double strokeWidth;

  const _PinMarkerPainter({
    required this.fillColor,
    required this.borderColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double startRad = 70 * 3.141592653589793 / 180;
    const double sweepRad = -320 * 3.141592653589793 / 180;

    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..arcTo(
        Rect.fromLTWH(0, 0, size.width, size.width),
        startRad,
        sweepRad,
        false,
      )
      ..close();

    canvas.drawShadow(path, DevicersColors.shadow, 6.0, false);

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _PinMarkerPainter oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}