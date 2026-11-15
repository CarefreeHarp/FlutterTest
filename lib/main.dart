import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/map_screen.dart';


void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        // Con el fondo oscuro de Devicers, el tema oscuro mantiene claros la hora y los
        // íconos de la barra de estado; sin él se pintan oscuros y casi no se ven.
        theme: ThemeData(brightness: Brightness.dark),
        
        home: const HomeScreen(),
        //home: const MapScreen(),

      ),
    );