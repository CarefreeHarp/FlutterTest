import 'package:material_ui/material_ui.dart';
import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:flutter_app/widgets/devicers_bottom_bar.dart';
import 'package:flutter_app/widgets/tinted_icon.dart';

// 1. Clase auxiliar para tipar los datos quemados y evitar errores de tipo "Object?"
class _MockReviewData {
  final String deviceImage;
  final String author;
  final String date;
  final String category;
  final String productName;
  final int rating;
  final String title;
  final String body;
  final String likes;
  final String comments;

  const _MockReviewData({
    required this.deviceImage,
    required this.author,
    required this.date,
    required this.category,
    required this.productName,
    required this.rating,
    required this.title,
    required this.body,
    required this.likes,
    required this.comments,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // 2. Lista de datos fuertemente tipados
  static const List<_MockReviewData> _mockReviews = [
    _MockReviewData(
      deviceImage: 'assets/images/device_09.png',
      author: '@prueba4',
      date: 'Dec 24, 2026',
      category: 'Norte Mobile • Celulares',
      productName: 'Norte Mobile A34',
      rating: 4,
      title: 'Excelente batería, cámaras mejorables',
      body: 'Llevo dos semanas usando el A34 y su batería es increíble, rinde todo el día sin problemas. La pantalla se ve muy bien bajo el sol, aunque las cámaras en la noche podrían mejorar bastante. Por este precio, es una compra excelente.',
      likes: '14',
      comments: '3',
    ),
    _MockReviewData(
      deviceImage: 'assets/images/device_06.png',
      author: '@tech_guru',
      date: 'Nov 12, 2026',
      category: 'Audio • Auriculares',
      productName: 'SoundMax Pro V2',
      rating: 5,
      title: 'Cancelación de ruido espectacular',
      body: 'Me sorprendió la calidad de sonido de estos audífonos. Los probé en un vuelo largo y la cancelación activa de ruido es de otro nivel. Son súper cómodos y la batería duró todo el viaje. Recomendadísimos.',
      likes: '42',
      comments: '8',
    ),
    _MockReviewData(
      deviceImage: 'assets/images/device_08.png',
      author: '@gamer_dev',
      date: 'Oct 05, 2026',
      category: 'Computadores • Portátiles',
      productName: 'Zephyr Gaming X15',
      rating: 3,
      title: 'Mucha potencia, pero se calienta demasiado',
      body: 'Corre cualquier juego actual en gráficos ultra sin despeinarse gracias a la RTX 4070. Sin embargo, el chasis se calienta muchísimo después de una hora de uso y los ventiladores suenan como turbinas. Hay que usar base refrigerante sí o sí.',
      likes: '5',
      comments: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DevicersColors.background,
      bottomNavigationBar: const DevicersBottomBar(selectedItem: 'home'),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _HomeHeader(),
            const _HomeTabs(),
            Divider(height: 1, thickness: 1, color: DevicersColors.border),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: _mockReviews.length, 
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(height: 1, thickness: 1, color: DevicersColors.border),
                ),
                itemBuilder: (context, index) {
                  // 3. Extraemos el objeto y pasamos sus valores fijos
                  final review = _mockReviews[index];
                  return _FeedReviewItem(
                    deviceImage: review.deviceImage,
                    author: review.author,
                    date: review.date,
                    category: review.category,
                    productName: review.productName,
                    rating: review.rating,
                    title: review.title,
                    body: review.body,
                    likes: review.likes,
                    comments: review.comments,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/logo_oscuro.png', 
            height: 28, 
            errorBuilder: (c, e, s) => const Icon(Icons.stars, size: 28)
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.notifications_none, size: 28, color: DevicersColors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _HomeTabs extends StatelessWidget {
  const _HomeTabs();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _TabItem(title: 'Para ti', iconPath: 'assets/images/for_you_icon.png', isSelected: true),
          _TabItem(title: 'Mapa', iconPath: 'assets/images/map_icon.png', isSelected: false),
          _TabItem(title: 'Siguiendo', iconPath: 'assets/images/following_icon.png', isSelected: false),
        ],
      ),
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? DevicersColors.selection : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: DevicersTextStyles.searchControl.copyWith(
                color: isSelected ? DevicersColors.textPrimary : DevicersColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            TintedIcon(
              path: iconPath,
              size: 20,
              color: isSelected ? DevicersColors.selection : DevicersColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedReviewItem extends StatelessWidget {
  final String deviceImage;
  final String author;
  final String date;
  final String category;
  final String productName;
  final int rating;
  final String title;
  final String body;
  final String likes;
  final String comments;

  const _FeedReviewItem({
    required this.deviceImage,
    required this.author,
    required this.date,
    required this.category,
    required this.productName,
    required this.rating,
    required this.title,
    required this.body,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  deviceImage,
                  width: 108,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(
                    width: 108,
                    height: 80,
                    color: DevicersColors.surfaceSecondary,
                    child: const Icon(Icons.devices, size: 40, color: DevicersColors.textSecondary),
                  ),
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
                            'assets/images/user_icon.png', 
                            width: 24, 
                            height: 24, 
                            fit: BoxFit.cover, 
                            errorBuilder: (c, e, s) => const CircleAvatar(radius: 12, backgroundColor: DevicersColors.surfaceSecondary, child: Icon(Icons.person, size: 16))
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            author,
                            style: DevicersTextStyles.searchControl.copyWith(color: DevicersColors.textPrimary, fontWeight: FontWeight.w700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(date, style: DevicersTextStyles.searchControl.copyWith(color: DevicersColors.textSecondary, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(category, style: DevicersTextStyles.searchControl.copyWith(color: DevicersColors.textSecondary, fontSize: 12)),
                    const SizedBox(height: 2),
                    Text(
                      productName,
                      style: DevicersTextStyles.searchHeading.copyWith(color: DevicersColors.textPrimary, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(5, (index) => Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        size: 16,
                        color: DevicersColors.rating,
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: DevicersTextStyles.searchHeading.copyWith(color: DevicersColors.textPrimary, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            body,
            style: DevicersTextStyles.searchControl.copyWith(color: DevicersColors.textSecondary),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Ver más',
                style: DevicersTextStyles.searchControl.copyWith(color: DevicersColors.selection, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const TintedIcon(path: 'assets/images/like_icon.png', color: DevicersColors.textSecondary, size: 24),
                  const SizedBox(width: 4),
                  Text(likes, style: DevicersTextStyles.searchControl.copyWith(color: DevicersColors.textPrimary)),
                  const SizedBox(width: 16),
                  const TintedIcon(path: 'assets/images/comment_icon.png', color: DevicersColors.textSecondary, size: 20),
                  const SizedBox(width: 4),
                  Text(comments, style: DevicersTextStyles.searchControl.copyWith(color: DevicersColors.textPrimary)),
                  const SizedBox(width: 16),
                  const TintedIcon(path: 'assets/images/send_icon.png', color: DevicersColors.textSecondary, size: 24),
                ],
              ),
              const TintedIcon(path: 'assets/images/bookmark_icon.png', color: DevicersColors.textSecondary, size: 22),
            ],
          ),
        ],
      ),
    );
  }
}