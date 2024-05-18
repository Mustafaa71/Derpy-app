import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ImagePickerController extends StateNotifier<AsyncValue<String?>> {
  final ImagePicker picker = ImagePicker();
  String? imagePath;

  static final imagePickerProvider = StateNotifierProvider<ImagePickerController, AsyncValue<String?>>((ref) {
    return ImagePickerController();
  });

  final supabase = Supabase.instance.client;

  ImagePickerController() : super(const AsyncValue.loading());

  Future<void> upload(BuildContext context) async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.gallery);

    if (imageFile == null) {
      state = const AsyncValue.data(null);
      return;
    }

    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      const uuid = Uuid();
      final fileName = '${uuid.v4()}.$fileExt';
      final filePath = fileName;
      imagePath = filePath;

      await supabase.storage.from('Gg').uploadBinary(
            filePath,
            bytes,
            fileOptions: const FileOptions(upsert: true),
          );

      state = AsyncValue.data(imagePath);
    } catch (error, stackTrace) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unexpected error occurred: $error'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
      state = AsyncValue.error(error.toString(), stackTrace);
    }
  }

  void clearImagePath() {
    imagePath = null;
    state = AsyncValue.data(imagePath);
  }
}
