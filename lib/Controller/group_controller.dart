import 'package:derpy/Model/event.dart';
import 'package:derpy/Model/group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupController extends StateNotifier<AsyncValue> {
  final supabase = Supabase.instance.client;
  static final groupControllerProvider = StateNotifierProvider<GroupController, AsyncValue>((ref) {
    return GroupController();
  });
  GroupController() : super(const AsyncLoading());

  Future<String> openGallery() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    try {
      if (image != null) {
        return image.path;
      }
    } catch (e) {
      print(e);
    }
    return 'null';
  }

  Future<void> createGroup(
    String id,
    String admin,
    String name,
    String description,
    String groupImage,
    String category,
    String location,
    bool accessModifier,
    List<String> members,
    List<Event> events,
  ) async {
    final group = Group(
      id: id,
      admin: admin,
      name: name,
      description: description,
      groupImage: groupImage,
      category: category,
      location: location,
      accessModifier: accessModifier,
      members: members,
      events: events,
    );

    final response = await supabase.from('group').insert([group.toJson()]);
    state = AsyncData(response);
  }
}
