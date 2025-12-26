import 'package:flutter/material.dart';

class MenuItems {
  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String link;
  final IconData icon;
}

const List<MenuItems> appMenuItems = [
  MenuItems(
    title: 'Botones',
    subtitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'Snackbars y Dialogs',
    subtitle: 'Indicatores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: 'Animated container',
    subtitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItems(
    title: 'UI Controls + Tiles',
    subtitle: 'Una serie de controles de flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
];
