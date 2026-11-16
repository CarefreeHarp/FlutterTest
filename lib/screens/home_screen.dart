import 'package:material_ui/material_ui.dart';
import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:flutter_app/widgets/devicers_bottom_bar.dart';
import 'package:flutter_app/widgets/tinted_icon.dart';

/// Datos quemados de una reseña del feed, equivalentes a `FeedReviewContent` de Android.
class _MockReviewData {
  final String deviceImage;
  final String author;

  /// Antigüedad relativa, como la genera `DateUtils.getRelativeTimeSpanString` en Android.
  final String timeAgo;
  final String brand;
  final String category;
  final String productName;
  final int rating;
  final String title;
  final String body;
  final int likes;
  final int dislikes;
  final int comments;

  const _MockReviewData({
    required this.deviceImage,
    required this.author,
    required this.timeAgo,
    required this.brand,
    required this.category,
    required this.productName,
    required this.rating,
    required this.title,
    required this.body,
    required this.likes,
    required this.dislikes,
    required this.comments,
  });
}

/// Pantalla principal con el feed editorial, copiada de `HomeView` de Android.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<_MockReviewData> _mockReviews = [
    _MockReviewData(
      deviceImage: 'assets/images/device_09.png',
      author: '@prueba4',
      timeAgo: 'hace 2 días',
      brand: 'Norte Mobile',
      category: 'Celulares',
      productName: 'Norte Mobile A34',
      rating: 4,
      title: 'Excelente batería, cámaras mejorables',
      body: 'Llevo dos semanas usando el A34 y su batería es increíble, rinde todo el día sin problemas. La pantalla se ve muy bien bajo el sol, aunque las cámaras en la noche podrían mejorar bastante. Por este precio, es una compra excelente.',
      likes: 14,
      dislikes: 1,
      comments: 3,
    ),
    _MockReviewData(
      deviceImage: 'assets/images/device_06.png',
      author: '@tech_guru',
      timeAgo: 'hace 5 días',
      brand: 'SoundMax',
      category: 'Auriculares',
      productName: 'SoundMax Pro V2',
      rating: 5,
      title: 'Cancelación de ruido espectacular',
      body: 'Me sorprendió la calidad de sonido de estos audífonos. Los probé en un vuelo largo y la cancelación activa de ruido es de otro nivel. Son súper cómodos y la batería duró todo el viaje. Recomendadísimos.',
      likes: 42,
      dislikes: 0,
      comments: 8,
    ),
    _MockReviewData(
      deviceImage: 'assets/images/device_08.png',
      author: '@gamer_dev',
      timeAgo: 'hace 1 semana',
      brand: 'Zephyr',
      category: 'Portátiles',
      productName: 'Zephyr Gaming X15',
      rating: 3,
      title: 'Mucha potencia, pero se calienta demasiado',
      body: 'Corre cualquier juego actual en gráficos ultra sin despeinarse gracias a la RTX 4070. Sin embargo, el chasis se calienta muchísimo después de una hora de uso y los ventiladores suenan como turbinas. Hay que usar base refrigerante sí o sí.',
      likes: 5,
      dislikes: 2,
      comments: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DevicersColors.background,
      // La barra inferior flota sobre el feed, como en Android; por eso la lista termina
      // con un espacio de 110 que deja ver la última reseña por encima de ella.
      extendBody: true,
      bottomNavigationBar: const DevicersBottomBar(selectedItem: 'home'),
      body: Column(
        children: [
          const _HomeTopBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const _HomeTabs(),
                  const SizedBox(height: 12),
                  const Divider(height: 3, thickness: 3, color: DevicersColors.border),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 20, bottom: 110),
                      itemCount: _mockReviews.length,
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(height: 1, thickness: 1, color: DevicersColors.border),
                      ),
                      itemBuilder: (context, index) => _FeedReviewItem(review: _mockReviews[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Encabezado con el logo centrado y la campana de notificaciones (`HomeTopBar` de Android).
class _HomeTopBar extends StatelessWidget {
  const _HomeTopBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 50,
        child: Stack(
          children: [
            Center(
              child: Image.asset('assets/images/logo_oscuro.png', width: 186, height: 50),
            ),
            Positioned(
              top: 0,
              right: 12,
              child: IconButton(
                onPressed: () {},
                icon: const TintedIcon(
                  path: 'assets/images/notifications_icon.png',
                  size: 26,
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

/// Pestañas Para ti, Mapa y Siguiendo con la línea corta del feed activo (`HomeTabs` de Android).
class _HomeTabs extends StatelessWidget {
  const _HomeTabs();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _TabItem(title: 'Para ti', iconPath: 'assets/images/for_you_icon.png', isSelected: true),
        ),
        Expanded(
          child: _TabItem(title: 'Mapa', iconPath: 'assets/images/map_icon.png', isSelected: false),
        ),
        Expanded(
          child: _TabItem(title: 'Siguiendo', iconPath: 'assets/images/following_icon.png', isSelected: false),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;

  const _TabItem({required this.title, required this.iconPath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: DevicersTextStyles.homeTab.copyWith(
            color: isSelected ? DevicersColors.textPrimary : DevicersColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        // En Android el ícono activo usa `primary` (burgundy), no el rosa de selección.
        TintedIcon(
          path: iconPath,
          size: 20,
          color: isSelected ? DevicersColors.primary : DevicersColors.textSecondary,
        ),
        const SizedBox(height: 4),
        // Línea corta de 44 bajo la pestaña activa; en las demás es transparente para
        // que todas las pestañas tengan el mismo alto.
        Container(
          width: 44,
          height: 3,
          decoration: BoxDecoration(
            color: isSelected ? DevicersColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }
}

/// Reseña del feed: miniatura, autor, producto, calificación y acciones (`FeedReviewItem` de Android).
class _FeedReviewItem extends StatelessWidget {
  final _MockReviewData review;

  const _FeedReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Igual que en Android: caja de 108 x 132 con la imagen completa (contain), recortada
            // con esquinas de 16 sobre los bordes de la caja.
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: 108,
                height: 132,
                child: Image.asset(review.deviceImage, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/no_pfp_icon.png',
                          width: 34,
                          height: 34,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          review.author,
                          style: DevicersTextStyles.titleSmall.copyWith(color: DevicersColors.textPrimary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        review.timeAgo,
                        style: DevicersTextStyles.bodySmall.copyWith(color: DevicersColors.textSecondary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${review.category} by ${review.brand}',
                    style: DevicersTextStyles.bodySmall.copyWith(color: DevicersColors.textSecondary),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    review.productName,
                    style: DevicersTextStyles.titleMedium.copyWith(color: DevicersColors.textPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Android dibuja el carácter ★ con color, no un ícono de Material.
                  Row(
                    children: List.generate(
                      5,
                      (index) => Text(
                        '★',
                        style: DevicersTextStyles.ratingStarsLarge.copyWith(
                          color: index < review.rating ? DevicersColors.rating : DevicersColors.ratingTrack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          review.title,
          style: DevicersTextStyles.titleSmall.copyWith(color: DevicersColors.textPrimary),
        ),
        const SizedBox(height: 4),
        Text(
          review.body,
          style: DevicersTextStyles.reviewContent.copyWith(color: DevicersColors.textSecondary),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            // Relleno y alto mínimo del `TextButton` de Compose.
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: const Size(58, 40),
            ),
            child: Text(
              'Ver más',
              style: DevicersTextStyles.labelLarge.copyWith(color: DevicersColors.primary),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            _ReviewAction(
              icon: const TintedIcon(path: 'assets/images/like_icon.png', size: 24.7, color: DevicersColors.textSecondary),
              count: review.likes,
            ),
            const SizedBox(width: 22),
            // El ícono de Android es el `thumb_down` de Material Icons.
            _ReviewAction(
              icon: const Icon(Icons.thumb_down, size: 24.7, color: DevicersColors.textSecondary),
              count: review.dislikes,
            ),
            const SizedBox(width: 22),
            _ReviewAction(
              icon: const TintedIcon(path: 'assets/images/comment_icon.png', size: 24.7, color: DevicersColors.textSecondary),
              count: review.comments,
            ),
            const SizedBox(width: 22),
            const _ReviewAction(
              icon: TintedIcon(path: 'assets/images/send_icon.png', size: 24.7, color: DevicersColors.textSecondary),
            ),
            const Spacer(),
            const _ReviewAction(
              icon: TintedIcon(path: 'assets/images/bookmark_icon.png', size: 24.7, color: DevicersColors.textSecondary),
            ),
          ],
        ),
      ],
    );
  }
}

/// Ícono de una acción de la reseña con su conteo opcional (`ReviewAction` de Android).
class _ReviewAction extends StatelessWidget {
  final Widget icon;
  final int? count;

  const _ReviewAction({required this.icon, this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        if (count != null) const SizedBox(width: 6),
        if (count != null)
          Text(
            '$count',
            style: DevicersTextStyles.feedReviewActionCount.copyWith(color: DevicersColors.textPrimary),
          ),
      ],
    );
  }
}
