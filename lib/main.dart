<<<<<<< HEAD
import 'package:flutter_app/screens/register_screen.dart';
import 'package:flutter_app/screens/search_product_screen.dart';
=======
import 'package:flutter_app/screens/chat_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
>>>>>>> task/#3
import 'package:material_ui/material_ui.dart';

void main() => runApp(
  MaterialApp(
<<<<<<< HEAD
=======
    debugShowCheckedModeBanner: false,
>>>>>>> task/#3
    // Con el fondo oscuro de Devicers, el tema oscuro mantiene claros la hora y los
    // íconos de la barra de estado; sin él se pintan oscuros y casi no se ven.
    theme: ThemeData(brightness: Brightness.dark),
    // Todavía no hay navegación: para ver otra pantalla se cambia este widget,
<<<<<<< HEAD
    // por ejemplo por SearchProductScreen().
    home: const RegisterScreen(),
    //home: const SearchProductScreen(),
=======
    // por ejemplo por ChatScreen().
    home: const ProfileScreen(),
    //home: const ChatScreen(),
>>>>>>> task/#3
  ),
);
