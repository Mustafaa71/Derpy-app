import 'package:flutter/material.dart';

class OtherSetting extends StatelessWidget {
  final IconData icon;
  final String label;

  const OtherSetting({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 25.0, color: Colors.white),
        const SizedBox(width: 12.0),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        const Spacer(),
        const Icon(Icons.chevron_right_sharp, size: 35.0, color: Colors.white),
      ],
    );
  }
}
