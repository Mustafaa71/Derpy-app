import 'package:flutter/material.dart';

class ReusableCardImage extends StatelessWidget {
  const ReusableCardImage({
    super.key,
    required this.imagePath,
    this.topRight = 20,
  });

  final String imagePath;
  final double? topRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: topRight != null ? const Radius.circular(20) : const Radius.circular(0),
            bottomLeft: const Radius.circular(20),
          ),
          child: Image.network(
            imagePath,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(
                  value: 1,
                  color: Colors.blue,
                ),
              );
            },
            errorBuilder: (
              BuildContext context,
              Object exception,
              StackTrace? stackTrace,
            ) {
              return const Icon(Icons.error);
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
