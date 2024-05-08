import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required this.label,
    required this.textColor,
    required this.backgroundcolor,
    required this.onClick,
    required this.borderColor,
    this.borderWidth = 1,
  });
  final String label;
  final Color textColor;
  final Color backgroundcolor;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: backgroundcolor,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: Text(
            label,
            style: TextStyleManager(
              kColor: Colors.black,
              kFontSize: 15.0,
              kFontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
