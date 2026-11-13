import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:flutter_app/widgets/devicers_bottom_bar.dart';
import 'package:flutter_app/widgets/devicers_button.dart';
import 'package:flutter_app/widgets/tinted_icon.dart';
import 'package:material_ui/material_ui.dart';

/// Pantalla de búsqueda de productos de Devicers, copiada visualmente de `SearchProductView`.
///
/// Muestra los filtros con valores quemados. Al usar solo StatelessWidget, los chips y el
/// control de calificación conservan su valor inicial; los campos de texto sí aceptan escritura.
class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DevicersColors.background,
      bottomNavigationBar: const DevicersBottomBar(selectedItem: 'search'),
      body: SafeArea(
        bottom: false,
        // El formulario completo supera pantallas pequeñas, por eso se desplaza como unidad.
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Buscar producto',
                style: DevicersTextStyles.screenTitle.copyWith(
                  color: DevicersColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),
              const SearchField(
                hint: 'Buscar dispositivos',
                height: 46,
                showSearchIcon: true,
              ),
              const SizedBox(height: 16),
              const SearchEntityToggle(),
              const SizedBox(height: 16),
              const FilterPanel(),
              // Deja aire para que el botón Crear, que sobresale de la barra, no tape
              // el botón de buscar al final del desplazamiento.
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// Campo de búsqueda redondeado con una lupa opcional.
///
/// Se dibuja con un Container para fijar su altura exacta y deja el TextField sin decoración
/// propia, como el `BasicTextField` de Android.
class SearchField extends StatelessWidget {
  /// Texto de ejemplo mostrado mientras el campo está vacío.
  final String hint;

  /// Altura del campo.
  final double height;

  /// Muestra la lupa al inicio del campo.
  final bool showSearchIcon;

  const SearchField({
    super.key,
    required this.hint,
    this.height = 42,
    this.showSearchIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: DevicersColors.surface,
        border: Border.all(color: DevicersColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (showSearchIcon) ...[
            const TintedIcon(
              path: 'assets/images/explore_icon.png',
              size: 19,
              color: DevicersColors.textSecondary,
            ),
            const SizedBox(width: 9),
          ],
          Expanded(
            child: TextField(
              cursorColor: DevicersColors.primary,
              style: DevicersTextStyles.searchControl.copyWith(
                color: DevicersColors.textPrimary,
                fontWeight: FontWeight.w400,
              ),
              // La decoración colapsada quita bordes y rellenos; el Container ya los dibuja.
              decoration: InputDecoration.collapsed(
                hintText: hint,
                hintStyle: DevicersTextStyles.searchControl.copyWith(
                  color: DevicersColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Selector entre la búsqueda de usuarios y la de productos, con Products activo.
class SearchEntityToggle extends StatelessWidget {
  const SearchEntityToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: DevicersButton(
            text: 'Users',
            height: 44,
            textStyle: DevicersTextStyles.searchControl,
            backgroundColor: DevicersColors.surface,
            foregroundColor: DevicersColors.textPrimary,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: DevicersButton(
            text: 'Products',
            height: 44,
            textStyle: DevicersTextStyles.searchControl,
          ),
        ),
      ],
    );
  }
}

/// Tarjeta con todos los filtros disponibles para acotar la búsqueda de productos.
class FilterPanel extends StatelessWidget {
  const FilterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        // La superficie secundaria agrupa los filtros y los separa del fondo.
        color: DevicersColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: DevicersColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterPanelHeader(),
          const SizedBox(height: 18),
          const FilterField(label: 'Marca', hint: 'Escribe una marca'),
          const SizedBox(height: 16),
          const FilterField(
            label: 'Nombre del producto',
            hint: 'Ej. auriculares',
          ),
          const SizedBox(height: 16),
          const FilterField(
            label: 'Fecha de lanzamiento',
            hint: 'DD / MM / AAAA',
          ),
          const SizedBox(height: 16),
          const FilterLabel(text: 'CATEGORÍA'),
          const SizedBox(height: 5),
          const OptionChipGroup(
            options: ['Todos', 'Celulares', 'Audio', 'Computadores'],
            selectedOption: 'Todos',
          ),
          const SizedBox(height: 18),
          const RatingFilter(minimumRating: 4),
          const SizedBox(height: 16),
          const FilterLabel(text: 'ORDENAR POR'),
          const SizedBox(height: 5),
          const OptionChipGroup(
            options: ['Más recientes', 'Mejor valorados'],
            selectedOption: 'Más recientes',
          ),
          const SizedBox(height: 22),
          DevicersButton(
            text: 'Buscar',
            height: 46,
            textStyle: DevicersTextStyles.searchControl.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Encabezado del panel con su título y la acción para limpiar los filtros.
class FilterPanelHeader extends StatelessWidget {
  const FilterPanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Filtros',
          style: DevicersTextStyles.searchHeading.copyWith(
            color: DevicersColors.textPrimary,
          ),
        ),
        // Empuja la acción de limpiar hasta el borde derecho del panel.
        const Spacer(),
        Text(
          'Limpiar',
          style: DevicersTextStyles.searchControl.copyWith(
            color: DevicersColors.primaryText,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

/// Etiqueta discreta que encabeza cada filtro.
class FilterLabel extends StatelessWidget {
  /// Texto de la etiqueta.
  final String text;

  const FilterLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: DevicersTextStyles.searchControl.copyWith(
        color: DevicersColors.textSecondary,
      ),
    );
  }
}

/// Filtro de texto: una etiqueta con su campo debajo.
class FilterField extends StatelessWidget {
  /// Etiqueta del filtro.
  final String label;

  /// Texto de ejemplo del campo.
  final String hint;

  const FilterField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterLabel(text: label),
        const SizedBox(height: 7),
        SearchField(hint: hint),
      ],
    );
  }
}

/// Grupo de chips en el que una sola opción aparece seleccionada.
class OptionChipGroup extends StatelessWidget {
  /// Opciones mostradas, en orden.
  final List<String> options;

  /// Opción que aparece seleccionada.
  final String selectedOption;

  const OptionChipGroup({
    super.key,
    required this.options,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    // Wrap baja los chips a otra línea si no caben, en lugar de desbordar la fila.
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final option in options)
          OptionChip(text: option, isSelected: option == selectedOption),
      ],
    );
  }
}

/// Chip con forma de píldora que indica si su opción está seleccionada.
class OptionChip extends StatelessWidget {
  /// Texto de la opción.
  final String text;

  /// Indica si la opción aparece seleccionada.
  final bool isSelected;

  const OptionChip({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: isSelected ? DevicersColors.selection : DevicersColors.surface,
        border: Border.all(
          color: isSelected ? DevicersColors.selection : DevicersColors.border,
        ),
        // Un radio mayor que la mitad de la altura redondea los extremos por completo.
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: DevicersTextStyles.searchControl.copyWith(
          color: isSelected
              ? DevicersColors.textOnSelection
              : DevicersColors.textPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Filtro de calificación mínima con su valor, el control deslizante y la escala de 0 a 5.
class RatingFilter extends StatelessWidget {
  /// Calificación mínima mostrada en el valor y en el control.
  final double minimumRating;

  const RatingFilter({super.key, required this.minimumRating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: FilterLabel(text: 'CALIFICACIÓN MÍNIMA')),
            Text(
              '${minimumRating.toStringAsFixed(1)}+',
              style: DevicersTextStyles.searchControl.copyWith(
                color: DevicersColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 24,
          child: SliderTheme(
            // Línea delgada y pulgar circular dorados, como el control de Android.
            data: SliderThemeData(
              trackHeight: 6,
              activeTrackColor: DevicersColors.rating,
              inactiveTrackColor: DevicersColors.border,
              thumbColor: DevicersColors.rating,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 9),
              trackShape: const RoundedRectSliderTrackShape(),
              overlayShape: SliderComponentShape.noOverlay,
              tickMarkShape: SliderTickMarkShape.noTickMark,
            ),
            child: Slider(
              value: minimumRating,
              max: 5,
              divisions: 5,
              // Sin estado el valor queda fijo; el callback vacío conserva el aspecto activo.
              onChanged: (value) {},
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var rating = 0; rating <= 5; rating++)
              Text(
                '$rating',
                style: DevicersTextStyles.searchControl.copyWith(
                  color: DevicersColors.textSecondary,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
