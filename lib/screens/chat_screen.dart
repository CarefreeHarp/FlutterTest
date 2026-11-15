import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:flutter_app/widgets/tinted_icon.dart';
import 'package:material_ui/material_ui.dart';

/// Mensaje de la conversación, con los datos quemados de la pantalla.
class _MockMessage {
  final String text;
  final String time;

  /// Indica si lo envió la persona que usa la app; esos mensajes van a la derecha.
  final bool isOwn;

  /// Indica si el mensaje recibió un "me gusta" (doble toque en la app Android).
  final bool isLiked;

  const _MockMessage({
    required this.text,
    required this.time,
    required this.isOwn,
    this.isLiked = false,
  });
}

/// Conversación entre dos personas, copiada de `ChatView` de la app Android.
///
/// Tiene el encabezado con la persona, los mensajes del día y el campo para escribir.
/// Igual que en Android, esta pantalla no muestra la barra de navegación inferior.
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const String _participant = '@tech_guru';

  static const List<_MockMessage> _messages = [
    _MockMessage(
      text: '¡Hola! Vi tu reseña de los SoundMax Pro V2, ¿sí valen la pena?',
      time: '10:12 a. m.',
      isOwn: true,
    ),
    _MockMessage(
      text:
          '¡Hola! Sí, totalmente. La cancelación de ruido es lo mejor que he probado en ese precio.',
      time: '10:14 a. m.',
      isOwn: false,
    ),
    _MockMessage(
      text: '¿Y la batería sí aguanta todo el día?',
      time: '10:15 a. m.',
      isOwn: true,
    ),
    _MockMessage(
      text: 'Me duran unas 30 horas con la cancelación encendida. Los cargo una vez por semana.',
      time: '10:17 a. m.',
      isOwn: false,
      isLiked: true,
    ),
    _MockMessage(
      text: 'Perfecto, creo que me los voy a comprar. ¡Gracias!',
      time: '10:18 a. m.',
      isOwn: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // El último mensaje propio lleva el "Visto", como en la app Android.
    final int lastOwnIndex = _messages.lastIndexWhere((message) => message.isOwn);

    return Scaffold(
      backgroundColor: DevicersColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const _ChatHeader(participant: _participant),
            const Divider(height: 1, thickness: 1, color: DevicersColors.border),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                // El primer elemento es el divisor del día; después vienen los mensajes.
                itemCount: _messages.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) return const _ChatDayDivider(date: 'Hoy');
                  final int messageIndex = index - 1;
                  return _ChatMessageBubble(
                    message: _messages[messageIndex],
                    isSeen: messageIndex == lastOwnIndex,
                  );
                },
              ),
            ),
            const _ChatComposer(),
          ],
        ),
      ),
    );
  }
}

/// Encabezado con la flecha de volver, la foto y el usuario de la otra persona.
class _ChatHeader extends StatelessWidget {
  final String participant;

  const _ChatHeader({required this.participant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          IconButton(
            // Sin navegación todavía, volver no hace nada.
            onPressed: () {},
            icon: const TintedIcon(
              path: 'assets/images/back_icon.png',
              size: 20,
              color: DevicersColors.textPrimary,
            ),
          ),
          const SizedBox(width: 12),
          ClipOval(
            child: Image.asset(
              'assets/images/user_icon.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            participant,
            style: DevicersTextStyles.searchHeading.copyWith(
              color: DevicersColors.textPrimary,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

/// Línea con la fecha que separa los mensajes de cada día.
class _ChatDayDivider extends StatelessWidget {
  final String date;

  const _ChatDayDivider({required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Expanded(child: Divider(color: DevicersColors.border)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              date,
              style: DevicersTextStyles.navigationLabel.copyWith(
                color: DevicersColors.textSecondary,
              ),
            ),
          ),
          const Expanded(child: Divider(color: DevicersColors.border)),
        ],
      ),
    );
  }
}

/// Burbuja de un mensaje: los propios van a la derecha con borde rosa y los recibidos a la
/// izquierda con borde gris. Debajo puede llevar el corazón del "me gusta" y el "Visto".
class _ChatMessageBubble extends StatelessWidget {
  final _MockMessage message;
  final bool isSeen;

  const _ChatMessageBubble({required this.message, required this.isSeen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: message.isOwn
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            // Igual que en Android, la burbuja no pasa de 300 de ancho.
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: DevicersColors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: message.isOwn
                    ? DevicersColors.primaryText
                    : DevicersColors.border,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: DevicersTextStyles.authenticationSupport.copyWith(
                    color: DevicersColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message.time,
                  style: DevicersTextStyles.navigationLabel.copyWith(
                    color: DevicersColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (message.isLiked)
            const Padding(
              padding: EdgeInsets.only(top: 6),
              child: TintedIcon(
                path: 'assets/images/like_icon.png',
                size: 18,
                color: DevicersColors.primaryText,
              ),
            ),
          if (isSeen)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Visto',
                style: DevicersTextStyles.navigationLabel.copyWith(
                  color: DevicersColors.textSecondary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Barra inferior para adjuntar una foto, escribir el mensaje y enviarlo.
class _ChatComposer extends StatelessWidget {
  const _ChatComposer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DevicersColors.surface,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const TintedIcon(
              path: 'assets/images/photo_icon.png',
              size: 24,
              color: DevicersColors.primaryText,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: DevicersTextStyles.authenticationSupport.copyWith(
                color: DevicersColors.textPrimary,
              ),
              cursorColor: DevicersColors.primaryText,
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje',
                hintStyle: DevicersTextStyles.authenticationSupport.copyWith(
                  color: DevicersColors.textSecondary,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: DevicersColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: DevicersColors.primaryText),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const TintedIcon(
              path: 'assets/images/send_icon.png',
              size: 24,
              color: DevicersColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
