import 'dart:async';
import 'dart:developer';

import 'package:derpy/Model/event.dart';
import 'package:derpy/Model/group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    fetchMyOwnGroups();
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

  /// This Function add group_id to groups column supabase[created group]...
  Future<void> addGroupIdToApiUserList(
    String newGroupId,
    String getUserId,
  ) async {
    log('Starting to add group ID: $newGroupId to user ID: $getUserId');

    // Fetch the current list of groups for the user
    final checkSupabaseResponse = await supabase.from('user').select('groups').eq('id', getUserId).single();

    log('Response from checking current groups: ${checkSupabaseResponse.toString()}');

    // Safely access the 'member_of' field
    final List<dynamic>? currentGroups = checkSupabaseResponse['groups'];

    if (currentGroups != null) {
      // If the user already has groups, append the new group ID
      final List<dynamic> updatedGroups = [...currentGroups, newGroupId];
      log('Updating existing groups with: $updatedGroups');

      final addValue = await supabase.from('user').update({'groups': updatedGroups}).eq('id', getUserId);

      log('Update response: ${addValue.toString()}');
    } else {
      // If the user has no groups, create the field with the new group ID
      final List<dynamic> updatedGroups = [newGroupId];
      log('User has no current groups. Creating new group list with: $updatedGroups');

      final addValue =
          await supabase.from('user').upsert({'id': getUserId, 'groups': updatedGroups}).eq('id', getUserId);

      log('Upsert response: ${addValue.toString()}');
    }
  }

  Future<void> addMeAsAmember(String userId, String newGroupId) async {
    log('Function starts ...');
    state = const AsyncLoading();
    log('Starting to add group ID: $newGroupId to user ID: $userId\n');
    try {
      log('Waiting for supabase Response: ....\n');

      final response = await supabase.from('user').select('member_of').eq('id', userId).single();

      log('addMeAsAmember function:\n supabase Res: ${response.toString()}');
      final List<dynamic>? currentMemberOf = response['member_of'];

      if (currentMemberOf != null) {
        final List<dynamic> updatedMemberOf = [...currentMemberOf, newGroupId];
        log('Updating existing member_of with: $updatedMemberOf');

        final addValue = await supabase.from('user').update({'member_of': updatedMemberOf}).eq('id', newGroupId);

        log('Update response: ${addValue.toString()}');
      } else {
        final List<dynamic> updatedMemberOf = [newGroupId];
        log('User has no current member_of. Creating new member_of list with: $updatedMemberOf');

        final addValue =
            await supabase.from('user').upsert({'id': userId, 'member_of': updatedMemberOf}).eq('id', userId);

        log('Upsert response: ${addValue.toString()}');
      }
    } catch (e) {
      log('Error occur in Group Controller [addMeAsAmember function]');
    }
  }

  /// This Function adds the userId into a groups into a group column
  ///
  Future<void> addUserIdIntoGroups(String userId, String newGroupId) async {
    log('Function starts ...');
    state = const AsyncLoading();
    log('Starting to add group ID: $newGroupId to user ID: $userId\n');
    try {
      log('Waiting for supabase Response: ....\n');

      final response = await supabase.from('group').select('members').eq('id', userId).single();

      log('addMeAsAmember function:\n supabase Res: ${response.toString()}');
      final List<dynamic>? currentMemberOf = response['members'];

      if (currentMemberOf != null) {
        final List<dynamic> updatedMemberOf = [...currentMemberOf, newGroupId];
        log('Updating existing member_of with: $updatedMemberOf');

        final addValue = await supabase.from('group').update({'members': updatedMemberOf}).eq('id', newGroupId);

        log('Update response: ${addValue.toString()}');
      } else {
        final List<dynamic> updatedMemberOf = [newGroupId];
        log('User has no current member_of. Creating new member_of list with: $updatedMemberOf');

        final addValue =
            await supabase.from('group').upsert({'id': userId, 'members': updatedMemberOf}).eq('id', userId);

        log('Upsert response: ${addValue.toString()}');
      }
    } catch (e) {
      log('Error occur in Group Controller [addUserIdIntoGroups function]');
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

  void fetchMyOwnGroups() async {
    state = const AsyncLoading();
    try {
      subscription = supabase.from('group').stream(primaryKey: ['id']).listen((event) {
        final myGroups = event.map((e) => Group.fromJson(e)).toList();
        state = AsyncValue.data(myGroups);
      });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      log('Error from groupController <fetchMyGroups>:$e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription?.cancel();
    super.dispose();
  }
}
