import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:flutter_app/widgets/devicers_bottom_bar.dart';
import 'package:flutter_app/widgets/devicers_button.dart';
import 'package:flutter_app/widgets/tinted_icon.dart';
import 'package:material_ui/material_ui.dart';

/// Reseña que aparece en la cuadrícula del perfil, con los datos quemados de la pantalla.
class _MockProfileReview {
  final String productImage;
  final String title;
  final int rating;

  const _MockProfileReview({
    required this.productImage,
    required this.title,
    required this.rating,
  });
}

/// Contador del encabezado del perfil, como "128 Seguidores".
class _MockProfileStat {
  final String number;
  final String label;

  const _MockProfileStat({required this.number, required this.label});
}

/// Perfil público de otra persona, copiado de `ProfileView` de la app Android.
///
/// Muestra la foto, el usuario, sus contadores, los botones de seguir y enviar mensaje,
/// la biografía y sus reseñas en dos columnas. Todos los datos están quemados.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String _username = '@tech_guru';

  static const String _biography =
      'Apasionado por la tecnología y los audífonos. Pruebo cada dispositivo al menos '
      'un mes antes de escribir la reseña.';

  static const List<_MockProfileStat> _stats = [
    _MockProfileStat(number: '12', label: 'Reseñas'),
    _MockProfileStat(number: '248', label: 'Seguidores'),
    _MockProfileStat(number: '180', label: 'Siguiendo'),
  ];

  static const List<_MockProfileReview> _reviews = [
    _MockProfileReview(
      productImage: 'assets/images/device_06.png',
      title: 'Cancelación de ruido espectacular',
      rating: 5,
    ),
    _MockProfileReview(
      productImage: 'assets/images/device_09.png',
      title: 'Excelente batería, cámaras mejorables',
      rating: 4,
    ),
    _MockProfileReview(
      productImage: 'assets/images/device_08.png',
      title: 'Mucha potencia, pero se calienta',
      rating: 3,
    ),
    _MockProfileReview(
      productImage: 'assets/images/device_06.png',
      title: 'Buen sonido por su precio',
      rating: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DevicersColors.background,
      bottomNavigationBar: const DevicersBottomBar(selectedItem: 'profile'),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _ProfileTopBar(username: _username),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 24),
                child: Column(
                  children: [
                    const _ProfileHeader(
                      username: _username,
                      biography: _biography,
                      stats: _stats,
                    ),
                    const SizedBox(height: 20),
                    const _ReviewsTab(),
                    const SizedBox(height: 14),
                    // La cuadrícula vive dentro del scroll de la pantalla, así que no hace
                    // scroll propio y toma solo el alto que necesitan sus tarjetas.
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1.05,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: _reviews
                          .map((review) => _ProfileReviewCard(review: review))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Encabezado con la flecha de volver, el usuario centrado y el botón de opciones.
class _ProfileTopBar extends StatelessWidget {
  final String username;

  const _ProfileTopBar({required this.username});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                // Sin navegación todavía, volver no hace nada.
                onPressed: () {},
                icon: const TintedIcon(
                  path: 'assets/images/back_icon.png',
                  size: 20,
                  color: DevicersColors.textPrimary,
                ),
              ),
            ),
            Text(
              username,
              style: DevicersTextStyles.searchHeading.copyWith(
                color: DevicersColors.textPrimary,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: DevicersColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Foto, usuario, contadores, botones de acción y biografía del perfil.
class _ProfileHeader extends StatelessWidget {
  final String username;
  final String biography;
  final List<_MockProfileStat> stats;

  const _ProfileHeader({
    required this.username,
    required this.biography,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/user_icon.png',
            width: 84,
            height: 84,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          username,
          style: DevicersTextStyles.searchHeading.copyWith(
            color: DevicersColors.textPrimary,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: stats
              .map((stat) => _ProfileStat(number: stat.number, label: stat.label))
              .toList(),
        ),
        const SizedBox(height: 22),
        const DevicersButton(text: 'Seguir', height: 48),
        const SizedBox(height: 10),
        const DevicersButton(
          text: 'Enviar mensaje',
          height: 48,
          backgroundColor: DevicersColors.surface,
          foregroundColor: DevicersColors.textPrimary,
        ),
        const SizedBox(height: 18),
        Text(
          biography,
          style: DevicersTextStyles.authenticationSupport.copyWith(
            color: DevicersColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

/// Número y etiqueta de uno de los contadores del perfil.
class _ProfileStat extends StatelessWidget {
  final String number;
  final String label;

  const _ProfileStat({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: DevicersTextStyles.searchHeading.copyWith(
            color: DevicersColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: DevicersTextStyles.searchControl.copyWith(
            color: DevicersColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

/// Pestaña "Reseñas" que encabeza la cuadrícula; es la única sección del perfil público.
class _ReviewsTab extends StatelessWidget {
  const _ReviewsTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: DevicersColors.selection, width: 3),
        ),
      ),
      child: Text(
        'Reseñas',
        textAlign: TextAlign.center,
        style: DevicersTextStyles.searchControl.copyWith(
          color: DevicersColors.primaryText,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Tarjeta de una reseña del perfil: imagen del producto, título y calificación.
class _ProfileReviewCard extends StatelessWidget {
  final _MockProfileReview review;

  const _ProfileReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DevicersColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: DevicersColors.shadow,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              review.productImage,
              width: 58,
              height: 58,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            review.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: DevicersTextStyles.searchControl.copyWith(
              color: DevicersColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < review.rating ? Icons.star : Icons.star_border,
                size: 16,
                color: DevicersColors.rating,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
