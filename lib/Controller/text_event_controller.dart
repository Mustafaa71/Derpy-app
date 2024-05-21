import 'package:derpy/Model/Text_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textEventProvider = StateNotifierProvider<TextEventNotifier, TextEventModel>((ref) {
  return TextEventNotifier(
    TextEventModel(
      titile: TextEditingController(),
      note: TextEditingController(),
      location: TextEditingController(),
      category: TextEditingController(),
      numberOfMembers: TextEditingController(),
      totalPrice: TextEditingController(),
    ),
  );
});

class TextEventNotifier extends StateNotifier<TextEventModel> {
  TextEventNotifier(super.state);

  void updateTitle(String newText) {
    state.titile.text = newText;
  }

  void updateNote(String newText) {
    state.note.text = newText;
  }

  void updateLocation(String newText) {
    state.location.text = newText;
  }

  void updateCategory(String newText) {
    state.category.text = newText;
  }

  void updateNumberOfMember(String newText) {
    state.numberOfMembers.text = newText;
  }

  void totalPrice(String newText) {
    state.totalPrice.text = newText;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    state.titile.dispose();
    state.note.dispose();
    state.location.dispose();
    state.category.dispose();
    state.numberOfMembers.dispose();
    state.totalPrice.dispose();
    super.dispose();
  }
}
