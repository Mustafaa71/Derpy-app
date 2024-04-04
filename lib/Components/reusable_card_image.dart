import 'package:flutter/material.dart';

class ReusableCardImage extends StatelessWidget {
  const ReusableCardImage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.network(
            imagePath,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
      ),
    );
  }
}
