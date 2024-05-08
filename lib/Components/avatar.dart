import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    required this.onClick,
  });

  final String? imageUrl;
  final VoidCallback onClick;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 130, maxHeight: 130),
        margin: const EdgeInsets.all(20.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: [
              widget.imageUrl == null
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF272A36),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera, color: Colors.blueAccent),
                            SizedBox(height: 6.0),
                            Text(
                              'Add photo',
                              style: TextStyle(
                                color: Color(0xFF797B83),
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(
                        widget.imageUrl!,
                        errorBuilder: (context, error, stackTrace) => Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF272A36),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: const Center(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Icon(Icons.camera, color: Colors.blueAccent),
                              SizedBox(height: 6.0),
                              Text(
                                'Add photo',
                                style: TextStyle(
                                  color: Color(0xFF797B83),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        width: 150,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
