import 'package:flutter/material.dart';

class NavBarItem {
  final String title;
  final IconData icon;
  final int value;

  NavBarItem({required this.title, required this.icon, this.value = 0});
}

final listItemsNavBar = [
  NavBarItem(title: "Inicio", icon: Icons.home),
  NavBarItem(title: "Galeria", icon: Icons.camera_roll_rounded, value: 1),
];
