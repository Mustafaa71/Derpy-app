import 'package:derpy/Components/card_tag.dart';
import 'package:derpy/Components/custom_text.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';

class ReusableCardContent extends StatelessWidget {
  const ReusableCardContent({
    super.key,
    required this.cardTitle,
    required this.cardDescription,
    required this.publicOrPrivate,
    required this.groupOrEvent,
    required this.numberOfMember,
  });

  final String cardTitle;
  final String cardDescription;
  final String publicOrPrivate;
  final String groupOrEvent;
  final String numberOfMember;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: cardTitle,
              style: TextStyleManager(
                kColor: Colors.white,
                kFontSize: 19.0,
                kFontWeight: FontWeight.bold,
              ),
            ),
            CustomText(
              title: cardDescription,
              style: const TextStyle(fontSize: 12),
            ),
            Row(
              children: [
                CardTag(
                  title: publicOrPrivate,
                  backgroundColor: const Color(0xFF0C356A),
                  fontAndBorderColor: const Color(0xFF0174BE),
                ),
                CardTag(
                  title: groupOrEvent,
                  backgroundColor: const Color(0xFF472086),
                  fontAndBorderColor: const Color(0xFF9369DF),
                ),
              ],
            ),
            const Divider(),
            Text(numberOfMember),
          ],
        ),
      ),
    );
  }
}
