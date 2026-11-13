import 'package:flutter_app/theme/devicers_colors.dart';
import 'package:flutter_app/theme/devicers_text_styles.dart';
import 'package:flutter_app/widgets/devicers_button.dart';
import 'package:flutter_app/widgets/tinted_icon.dart';
import 'package:material_ui/material_ui.dart';

/// Pantalla de registro de Devicers, copiada visualmente de `RegisterView` de Android.
///
/// Solo usa StatelessWidget: los campos aceptan texto, pero la validación, el cambio de
/// visibilidad de la contraseña y la creación de la cuenta requieren manejo de estado.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DevicersColors.background,
      appBar: AppBar(
        title: const DevicersLogo(),
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: DevicersColors.background,
        // Evita que Material 3 tiña la barra cuando el formulario pasa por debajo.
        scrolledUnderElevation: 0,
      ),
      // El formulario completo no cabe en pantallas pequeñas, por eso se desplaza.
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 36),
            const AuthenticationTitle(
              title: 'Crea tu cuenta',
              description:
                  'Construye un perfil tech confiable y guarda cada reseña.',
            ),
            const SizedBox(height: 32),
            const AuthenticationField(
              label: 'Nombre de usuario',
              hint: '@usuario',
            ),
            const SizedBox(height: 18),
            const AuthenticationField(
              label: 'Correo electrónico',
              hint: 'tu@correo.com',
            ),
            const SizedBox(height: 18),
            const AuthenticationField(
              label: 'Contraseña',
              hint: '◉◉◉◉',
              isPassword: true,
            ),
            const SizedBox(height: 18),
            const AuthenticationField(
              label: 'Repite tu contraseña',
              hint: '◉◉◉◉',
              isPassword: true,
            ),
            const SizedBox(height: 24),
            const DevicersButton(text: 'Crear cuenta'),
            const SizedBox(height: 26),
            Text(
              'o continúa con',
              style: DevicersTextStyles.authenticationSupport.copyWith(
                color: DevicersColors.primaryText,
              ),
            ),
            const SizedBox(height: 18),
            const SocialButtons(),
            const SizedBox(height: 28),
            const AuthenticationFooter(
              text: '¿Ya tienes cuenta?',
              actionText: 'Iniciar sesión',
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// Logo de Devicers que encabeza las pantallas de autenticación.
class DevicersLogo extends StatelessWidget {
  const DevicersLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo_oscuro.png', width: 186, height: 50);
  }
}

/// Título y descripción de apoyo de una pantalla de autenticación.
class AuthenticationTitle extends StatelessWidget {
  /// Texto principal de la pantalla.
  final String title;

  /// Texto secundario que explica el propósito de la pantalla.
  final String description;

  const AuthenticationTitle({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // La columna padre centra a sus hijos; ocupar todo el ancho deja el título a la izquierda.
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: DevicersTextStyles.authenticationTitle.copyWith(
              color: DevicersColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: DevicersTextStyles.authenticationDescription.copyWith(
              color: DevicersColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Campo de autenticación con su etiqueta encima y soporte opcional para contraseña.
///
/// Se reutiliza para los cuatro campos del formulario cambiando solo sus parámetros.
class AuthenticationField extends StatelessWidget {
  /// Etiqueta mostrada sobre el campo.
  final String label;

  /// Texto de ejemplo mostrado mientras el campo está vacío.
  final String hint;

  /// Oculta el contenido y muestra el ícono de contraseña.
  final bool isPassword;

  const AuthenticationField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: DevicersTextStyles.authenticationFieldLabel.copyWith(
            color: DevicersColors.textPrimary,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: isPassword,
          cursorColor: DevicersColors.primary,
          style: DevicersTextStyles.fieldInput.copyWith(
            color: DevicersColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: DevicersTextStyles.fieldHint.copyWith(
              color: DevicersColors.textSecondary,
            ),
            filled: true,
            fillColor: DevicersColors.surface,
            // El relleno vertical deja el campo en los 56 de alto del diseño Android.
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            // El ícono es fijo: alternar la visibilidad requiere estado.
            // Flutter reserva 48 de alto y ancho para un ícono tocable; el relleno de 14
            // completa ese espacio y deja el ojo en 20, como el IconButton de Android.
            suffixIcon: isPassword
                ? const Padding(
                    padding: EdgeInsets.all(14),
                    child: TintedIcon(
                      path: 'assets/images/hidden.png',
                      size: 20,
                      color: DevicersColors.textSecondary,
                    ),
                  )
                : null,
            enabledBorder: buildFieldBorder(DevicersColors.border),
            focusedBorder: buildFieldBorder(DevicersColors.primary),
          ),
        ),
      ],
    );
  }
}

/// Fila con las alternativas de registro con Google, Facebook y GitHub.
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: SocialButton(
            iconPath: 'assets/images/google.png',
            label: 'Google',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: SocialButton(
            iconPath: 'assets/images/facebook_app_symbol.png',
            label: 'Facebook',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: SocialButton(
            iconPath: 'assets/images/github_icon.png',
            label: 'GitHub',
          ),
        ),
      ],
    );
  }
}

/// Botón social con borde, ícono teñido y etiqueta corta.
class SocialButton extends StatelessWidget {
  /// Ruta del ícono dentro de `assets/images/`.
  final String iconPath;

  /// Nombre del proveedor mostrado junto al ícono.
  final String label;

  const SocialButton({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: DevicersColors.surface,
          foregroundColor: DevicersColors.primaryText,
          side: const BorderSide(color: DevicersColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        icon: TintedIcon(
          path: iconPath,
          size: 16,
          color: DevicersColors.primaryText,
        ),
        label: Text(
          label,
          style: DevicersTextStyles.authenticationSupport.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// Pie con la pregunta sobre la cuenta y su acción resaltada.
class AuthenticationFooter extends StatelessWidget {
  /// Pregunta mostrada antes de la acción.
  final String text;

  /// Acción mostrada en negrilla, como "Iniciar sesión".
  final String actionText;

  const AuthenticationFooter({
    super.key,
    required this.text,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: DevicersTextStyles.authenticationSupport.copyWith(
            color: DevicersColors.primaryText,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          actionText,
          style: DevicersTextStyles.authenticationSupport.copyWith(
            color: DevicersColors.primaryText,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

/// Construye el borde redondeado de los campos de autenticación con el color indicado.
///
/// Como `buildInputDecoration` de la clase, extrae a una función el estilo que se repite
/// entre el estado normal y el estado enfocado del campo.
OutlineInputBorder buildFieldBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );
}
