import 'dart:developer';

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

  Future<void> addGroupIdToApiUserList(
    String newGroupId,
    Object getUserId,
  ) async {
    final checkSupabaseResponse = await supabase.from('user').select('groups').eq('id', getUserId.toString()).single();

    log(checkSupabaseResponse.toString());

    final List<dynamic>? currentGroups = checkSupabaseResponse['groups'];

    if (currentGroups != null) {
      final List<dynamic> updatedGroups = [...currentGroups, newGroupId];

      final addValue = await supabase.from('user').update({'groups': updatedGroups}).eq('id', getUserId.toString());

      log(addValue.toString());
    } else {
      final List<dynamic> updatedGroups = [newGroupId];

      final addValue = await supabase
          .from('user')
          .upsert({'id': getUserId, 'groups': updatedGroups}).eq('id', '2ce67ac6-6f56-4fb9-b5b7-e54b4c9219f7');

      log(addValue.toString());
    }
  }
}
