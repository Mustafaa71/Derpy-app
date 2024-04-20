import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    // required this.onUpload,
    required this.onClick,
  });

  final String? imageUrl;
  // final void Function(String) onUpload;
  final void Function() onClick;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool isLoading = false;
  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 130, maxHeight: 130),
        margin: const EdgeInsets.all(20.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: widget.imageUrl == null || widget.imageUrl!.isEmpty
              ? Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF272A36),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.camera,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          'Add photo',
                          style: TextStyleManager(
                            kColor: const Color(0xFF797B83),
                            kFontSize: 20.0,
                            kFontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  color: Colors.amber,
                  width: 150.0,
                  height: 150.0,
                ),
        ),
      ),
    );
  }
}
