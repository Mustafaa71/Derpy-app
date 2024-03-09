import 'package:flutter/material.dart';

class CardTag extends StatelessWidget {
  const CardTag({
    required this.title,
    required this.backgroundColor,
    required this.fontAndBorderColor,
    super.key,
  });

  final String title;
  final Color backgroundColor;
  final Color fontAndBorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.fromBorderSide(BorderSide(color: fontAndBorderColor)),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      margin: const EdgeInsets.only(top: 5.0, right: 8.0, bottom: 5.0),
      child: Text(
        title,
        style: TextStyle(color: fontAndBorderColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
