import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImagePickerController extends StateNotifier<AsyncValue> {
  final ImagePicker picker = ImagePicker();
  static final imagePickerProvider = StateNotifierProvider<ImagePickerController, AsyncValue>((ref) {
    return ImagePickerController();
  });
  final supabase = Supabase.instance.client;
  ImagePickerController() : super(const AsyncLoading());

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    try {
      if (image != null) {
        image.path;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadImageToSupabase(String imagePath) async {
    try {
      File file = File(imagePath);

      final storage = supabase.storage.from('group_images/images');
      final fileName = '$imagePath/.jpg';
      final response = await storage.upload(
        fileName,
        file,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: true,
        ),
      );

      if (response.isNotEmpty) {
        // Image uploaded successfully
        print('Image uploaded successfully.');
      } else {
        // Handle error if upload failed
        print('Error uploading image: $response');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
