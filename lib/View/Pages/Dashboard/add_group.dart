import 'dart:developer';

import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/image_picker_controller.dart';
import 'package:derpy/Model/group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddGroup extends HookConsumerWidget {
  const AddGroup({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState('Football');
    final supabase = Supabase.instance.client;
    void handleCategoryChange(String? newValue) {
      selectedCategory.value = newValue!;
    }

    String? selectedImagePath;

    Future<String> openGallery() async {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      try {
        if (image != null) {
          final imagePath = image.path;
          final result = imagePath.split('/').last;
          selectedImagePath = result;
          log(result);
        }
      } catch (e) {
        print(e);
      }
      return '';
    }

    Future<String> imagePath() async {
      return await openGallery();
    }

    ///dasdsad
    final imagePickerController = ref.watch(ImagePickerController.imagePickerProvider.notifier);

    final textControllerState = ref.watch(TextEditingControllerNotifier.textEditingControllerProvider);

    final titleEditingController = textControllerState.titleController;
    final descriptionEditingController = textControllerState.descriptionController;
    final locationEditingController = textControllerState.locationController;

    const kBorderRadius = Radius.circular(20.0);

    final groupAdmin = ref.watch(AuthController.authControllerProvider.notifier);
    final String? userId = groupAdmin.getUserId();

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: ColorManager.kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: kBorderRadius,
          topRight: kBorderRadius,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Create Group',
            style: TextStyleManager(kColor: Colors.white, kFontSize: 15.0, kFontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.blueAccent),
          InkWell(
            onTap: () {
              openGallery();
            },
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 130, maxHeight: 130),
                margin: const EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
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
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color(0xFF272A36), borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Column(
              children: [
                TextField(
                  controller: titleEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Group Title (required)',
                    prefixIcon: Icon(
                      Icons.border_color,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Divider(),
                TextField(
                  controller: descriptionEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Group Description (required)',
                    prefixIcon: Icon(
                      Icons.document_scanner,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Divider(),
                TextField(
                  controller: locationEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Group Location (required)',
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Category',
              style: TextStyleManager(kColor: Colors.white, kFontSize: 15.0, kFontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: const BoxDecoration(
              color: Color(0xFF272A36),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: <String>['Football', 'Padel', 'Chess', 'Diving']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(value: value, child: Text(value)),
                    )
                    .toList(),
                value: selectedCategory.value,
                onChanged: handleCategoryChange,
                icon: const Icon(Icons.arrow_downward),
              ),
            ),
          ),

          /// Padding(
          ///   padding: const EdgeInsets.only(top: 15.0),
          ///   child: ToggleButtons(
          ///     isSelected: [
          ///       selectedModifierIndex.value == 0,
          ///       selectedModifierIndex.value == 1,
          ///     ],
          ///     onPressed: (int index) {
          ///       selectedModifierIndex.value = index;
          ///       print('Selected modifier: ${accessModifier[index]}');
          ///     },
          ///     constraints: const BoxConstraints(minHeight: 40.0, minWidth: 80.0),
          ///     selectedColor: Colors.white,
          ///     selectedBorderColor: Colors.blueAccent,
          ///     borderRadius: const BorderRadius.all(Radius.circular(8)),
          ///     children: [
          ///       Text(accessModifier.first),
          ///       Text(accessModifier[1]),
          ///     ],
          ///   ),
          /// ),
          const Spacer(),
          InkWell(
            onTap: () {
              Future.microtask(() async {
                if (titleEditingController.text.isEmpty ||
                    descriptionEditingController.text.isEmpty ||
                    locationEditingController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Warning'),
                        content: const Text('Enter all required information'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  final addGg = Group(
                    admin: userId.toString(),
                    name: titleEditingController.text,
                    description: descriptionEditingController.text,
                    groupImage: selectedImagePath ?? '',
                    category: selectedCategory.value,
                    location: locationEditingController.text,
                    accessModifier: false,
                    members: [],
                    events: [],
                  );

                  await supabase.from('group').insert([addGg.toJson()]);

                  log('message: GG is working');
                  titleEditingController.clear();
                  descriptionEditingController.clear();
                  locationEditingController.clear();
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                }
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: Text(
                        'submit',
                        style: TextStyleManager(
                          kColor: const Color(0xFF0B111A),
                          kFontSize: 25.0,
                          kFontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextControllerState {
  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController locationController;
  TextControllerState({
    required this.titleController,
    required this.descriptionController,
    required this.locationController,
  });
}

class TextEditingControllerNotifier extends StateNotifier<TextControllerState> {
  static final textEditingControllerProvider =
      StateNotifierProvider<TextEditingControllerNotifier, TextControllerState>((ref) {
    return TextEditingControllerNotifier(TextControllerState(
      titleController: TextEditingController(),
      descriptionController: TextEditingController(),
      locationController: TextEditingController(),
    ));
  });

  TextEditingControllerNotifier(super.state);

  void updateTitle(String newText) {
    state.titleController.text = newText;
  }

  void updateDescription(String newText) {
    state.descriptionController.text = newText;
  }

  void updateLocation(String newText) {
    state.locationController.text = newText;
  }

  @override
  void dispose() {
    state.titleController.dispose();
    state.descriptionController.dispose();
    state.locationController.dispose();

    super.dispose();
  }
}
