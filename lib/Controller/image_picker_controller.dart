import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ImagePickerController extends StateNotifier<AsyncValue> {
  final ImagePicker picker = ImagePicker();
  String? imagePath;

  static final imagePickerProvider = StateNotifierProvider<ImagePickerController, AsyncValue>((ref) {
    return ImagePickerController();
  });
  final supabase = Supabase.instance.client;
  ImagePickerController() : super(const AsyncLoading());

  Future<void> upload(
    BuildContext context,
    bool isLoading,
  ) async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) {
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
    } on StorageException catch (error) {
      if (context.mounted) {
        log(error.toString());
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Unexpected error occurred'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
    state = AsyncData(imagePath);
    print(state);
    isLoading = false;
  }
}
