import 'package:derpy/Constants/color_manager.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.children,
    this.selectedIndex = 0,
    required this.onTap,
  });

  final List<Widget> children;
  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 24.0),
      decoration: const BoxDecoration(
        color: ColorManager.kBackgroundColor,
      ),
      height: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          children.length,
          (index) => InkWell(
            onTap: () => onTap(index),
            child: children[index],
          ),
        ),
      ),
    );
  }
}
