import 'package:derpy/Components/custom_text.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    required this.title,
    required this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: Color(0xFF50ACA8),
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        margin: const EdgeInsets.only(right: 8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: CustomText(
            title: title,
            style: TextStyleManager(kColor: const Color(0xFF50ACA8), kFontSize: 15.0, kFontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
