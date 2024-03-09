import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.title,
    required this.style,
    super.key,
  });

  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}
