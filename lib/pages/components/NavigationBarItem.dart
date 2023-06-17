import 'package:flutter/cupertino.dart';

class NavigationBarItem {
  final Widget icon;
  final Text title;
  final VoidCallback onPressed;

  NavigationBarItem({
    required this.icon,
    required this.title,
    required this.onPressed,
  });
}
