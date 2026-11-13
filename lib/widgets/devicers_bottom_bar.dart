import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:flutter_app/widgets/tinted_icon.dart';
import 'package:material_ui/material_ui.dart';

/// Barra de navegación inferior flotante de Devicers, copiada de `BottomNavigationBar` de Android.
///
/// Se ubica en `Scaffold.bottomNavigationBar` de las pantallas principales. Todavía no navega:
/// solo resalta el destino de la pantalla actual.
class DevicersBottomBar extends StatelessWidget {
  /// Destino resaltado: `home`, `search`, `create`, `chats` o `profile`.
  final String selectedItem;

  const DevicersBottomBar({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    // SafeArea separa la barra de los gestos del sistema en la parte inferior.
    return SafeArea(
      top: false,
      child: Container(
        height: 66,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
        decoration: BoxDecoration(
          color: DevicersColors.surface,
          borderRadius: BorderRadius.circular(33),
          boxShadow: const [
            BoxShadow(
              color: DevicersColors.shadow,
              blurRadius: 20,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          // Alinear por la base deja todas las etiquetas sobre una misma línea.
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: BottomBarItem(
                iconPath: 'assets/images/home_icon.png',
                label: 'Inicio',
                isSelected: selectedItem == 'home',
              ),
            ),
            Expanded(
              child: BottomBarItem(
                iconPath: 'assets/images/explore_icon.png',
                label: 'Buscar',
                isSelected: selectedItem == 'search',
              ),
            ),
            Expanded(
              child: CreateReviewButton(isSelected: selectedItem == 'create'),
            ),
            Expanded(
              child: BottomBarItem(
                iconPath: 'assets/images/comment_icon.png',
                label: 'Chats',
                isSelected: selectedItem == 'chats',
              ),
            ),
            Expanded(
              child: BottomBarItem(
                iconPath: 'assets/images/profile_icon.png',
                label: 'Perfil',
                isSelected: selectedItem == 'profile',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Destino individual de la barra inferior con su ícono y su etiqueta.
///
/// El destino activo se distingue solo por color y grosor, sin cambiar de tamaño.
class BottomBarItem extends StatelessWidget {
  /// Ruta del ícono dentro de `assets/images/`.
  final String iconPath;

  /// Etiqueta mostrada bajo el ícono.
  final String label;

  /// Indica si este destino corresponde a la pantalla actual.
  final bool isSelected;

  const BottomBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected
        ? DevicersColors.primaryText
        : DevicersColors.textSecondary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TintedIcon(path: iconPath, size: 24, color: color),
        const SizedBox(height: 3),
        Text(
          label,
          style: DevicersTextStyles.navigationLabel.copyWith(
            color: color,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Botón central y elevado de la barra inferior que inicia la creación de una reseña.
class CreateReviewButton extends StatelessWidget {
  /// Indica si la pantalla de creación es la pantalla actual.
  final bool isSelected;

  const CreateReviewButton({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    // El botón mide más que la barra; OverflowBox le permite sobresalir hacia arriba
    // sin desbordar la fila, igual que `wrapContentHeight(unbounded = true)` en Android.
    return OverflowBox(
      maxHeight: double.infinity,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: DevicersColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: DevicersColors.shadow,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            // Center evita que el ícono se estire a los 54 del círculo.
            child: const Center(
              child: TintedIcon(
                path: 'assets/images/create_review_icon.png',
                size: 26,
                color: DevicersColors.textOnPrimary,
              ),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            'Crear',
            style: DevicersTextStyles.navigationLabel.copyWith(
              color: isSelected
                  ? DevicersColors.primaryText
                  : DevicersColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
