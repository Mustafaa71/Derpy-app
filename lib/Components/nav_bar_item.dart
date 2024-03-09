import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
  });
  final IconData icon;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 25.0, color: isSelected ? Colors.blue : const Color(0xFF82868D)),
        const SizedBox(height: 8.0),
        Text(title, style: TextStyle(color: isSelected ? Colors.blue : const Color(0xFF82868D))),
      ],
    );
  }
}
