import 'package:flutter_app/screens/register_screen.dart';
import 'package:flutter_app/screens/search_product_screen.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_app/screens/chat_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/map_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';

void main() => runApp(
  MaterialApp(
    // Con el fondo oscuro de Devicers, el tema oscuro mantiene claros la hora y los
    // íconos de la barra de estado; sin él se pintan oscuros y casi no se ven.
    theme: ThemeData(brightness: Brightness.dark),
    // Todavía no hay navegación: para ver otra pantalla se cambia este widget,
    //home: const RegisterScreen(),
    //home: const SearchProductScreen(),
    home: const HomeScreen(),
    //home: const MapScreen(),
    //home: const ProfileScreen(),
    //home: const ChatScreen(),
  ),
);
