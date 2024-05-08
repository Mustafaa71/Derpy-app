import 'package:derpy/Components/reusable_card_content.dart';
import 'package:derpy/Components/reusable_card_image.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.visibilty,
    required this.groupOrEvent,
    required this.numberOfMember,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final String description;
  final String visibilty;
  final String groupOrEvent;
  final VoidCallback onTap;
  final String numberOfMember;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: Colors.grey),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ReusableCardImage(
              imagePath: imagePath,
              topRight: null,
            ),
            ReusableCardContent(
              cardTitle: title,
              cardDescription: description,
              publicOrPrivate: visibilty,
              groupOrEvent: groupOrEvent,
              numberOfMember: numberOfMember,
            ),
          ],
        ),
      ),
    );
  }
}
