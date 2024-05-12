import 'dart:async';
import 'dart:developer';

import 'package:derpy/Model/event.dart';
import 'package:derpy/Model/group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupController extends StateNotifier<AsyncValue<List<Group>>> {
  final supabase = Supabase.instance.client;
  List<Group> groupList = [];
  StreamSubscription<SupabaseStreamEvent>? subscription;

  static final groupControllerProvider = StateNotifierProvider<GroupController, AsyncValue>((ref) {
    return GroupController();
  });
  GroupController() : super(const AsyncValue.loading()) {
    getGroupData();
  }

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

  ///<-------------- Delete Group -------------->
  ///
  Future<void> removeGroup(String groupId) async {
    final response = await supabase.from('group').delete().eq('group_id', groupId);
    state = AsyncData(response);
  }

  Future<List<Map<String, dynamic>>> fetchUsersWithGroup(String groupId) async {
    try {
      final response = await supabase.from('user').select('id, member_of').contains('member_of', [groupId]);

      log('response: $response');

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      log('Exception fetching users: $e');
      return [];
    }
  }

  Future<void> removeGroupIdFromUsers(String groupId) async {
    final users = await fetchUsersWithGroup(groupId);
    for (var user in users) {
      List<String> updatedMemberOf = List<String>.from(user['member_of']);
      updatedMemberOf.removeWhere((id) => id == groupId);

      try {
        final response = await supabase.from('user').update({'member_of': updatedMemberOf}).eq('id', user['id']);

        if (response.error != null) {
          log('Error updating user ${user['id']}: ${response.error!.message}');
        } else {
          log('Updated user ${user['id']} successfully');
        }
      } catch (e) {
        log('Exception updating user ${user['id']}: $e');
      }
    }
  }

  void getGroupData() {
    state = const AsyncValue.loading();
    subscription = supabase.from('group').stream(primaryKey: ['id']).listen(
      (event) {
        final groups = event.map<Group>((e) => Group.fromJson(e)).toList();
        state = AsyncValue.data(groups);
      },
      onError: (e) {
        state = AsyncValue.error(e, StackTrace.current);
        debugPrint('Error Regarding To Supabase Stream: $e');
        return const Icon(Icons.warning);
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription?.cancel();
    super.dispose();
  }
}
