import 'package:derpy/Model/textEditingControllerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextEditingControllerState extends StateNotifier<TextEditingControllerModel> {
  static final textEditingControllerProvider =
      StateNotifierProvider<TextEditingControllerState, TextEditingControllerModel>(
    (ref) {
      return TextEditingControllerState(
        TextEditingControllerModel(
          titleController: TextEditingController(),
          descriptionController: TextEditingController(),
          locationController: TextEditingController(),
        ),
      );
    },
  );

  TextEditingControllerState(super.state);

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
