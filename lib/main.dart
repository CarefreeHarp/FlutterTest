import 'package:flutter_app/screens/chat_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import 'package:material_ui/material_ui.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    // Con el fondo oscuro de Devicers, el tema oscuro mantiene claros la hora y los
    // íconos de la barra de estado; sin él se pintan oscuros y casi no se ven.
    theme: ThemeData(brightness: Brightness.dark),
    // Todavía no hay navegación: para ver otra pantalla se cambia este widget,
    // por ejemplo por ChatScreen().
    home: const ProfileScreen(),
    //home: const ChatScreen(),
  ),
);
