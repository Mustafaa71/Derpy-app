import 'dart:async';
import 'dart:developer';

import 'package:derpy/Model/group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupController extends StateNotifier<AsyncValue<List<Group>>> {
  final supabase = Supabase.instance.client;
  StreamSubscription<List<Map<String, dynamic>>>? subscription;

  static final groupControllerProvider = StateNotifierProvider<GroupController, AsyncValue<List<Group>>>((ref) {
    return GroupController();
  });

  GroupController() : super(const AsyncValue.loading()) {
    getGroupData();
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
    List<String> events,
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
    if (response.error != null) {
      state = AsyncValue.error(response.error!, StackTrace.current);
    }
  }

  /// Add Group_id to User [groups column]...
  Future<void> addGroupIdToApiUserList(String newGroupId, String getUserId) async {
    log('Starting to add group ID: $newGroupId to user ID: $getUserId');

    final checkSupabaseResponse = await supabase.from('user').select('groups').eq('id', getUserId).single();

    log('Response from checking current groups: ${checkSupabaseResponse.toString()}');

    final List<dynamic>? currentGroups = checkSupabaseResponse['groups'];

    if (currentGroups != null) {
      final List<dynamic> updatedGroups = [...currentGroups, newGroupId];

      final addValue = await supabase.from('user').update({'groups': updatedGroups}).eq('id', getUserId);
      log('Update response: ${addValue.toString()}');
    } else {
      final List<dynamic> updatedGroups = [newGroupId];

      await supabase.from('user').upsert({'id': getUserId, 'groups': updatedGroups}).eq('id', getUserId);
    }
  }

  Future<void> enrollGroup(String userId, String newGroupId) async {
    log('Function starts ...');
    try {
      log('Waiting for supabase Response: ....\n');

      final response = await supabase.from('user').select('member_of').eq('id', userId).single();
      log('addMeAsAmember function:\n supabase Res: ${response.toString()}');

      final List<dynamic>? currentMemberOf = response['member_of'];

      if (currentMemberOf != null) {
        final List<dynamic> updatedMemberOf = [...currentMemberOf, newGroupId];
        log('Updating existing member_of with: $updatedMemberOf');

        final addValue = await supabase.from('user').update({'member_of': updatedMemberOf}).eq('id', userId);

        log('Update response: ${addValue.toString()}');
      } else {
        final List<dynamic> updatedMemberOf = [newGroupId];
        log('User has no current member_of. Creating new member_of list with: $updatedMemberOf');

        final addValue =
            await supabase.from('user').upsert({'id': userId, 'member_of': updatedMemberOf}).eq('id', userId);
        log('Upsert response: ${addValue.toString()}');
      }
    } catch (e) {
      log('Error occur in Group Controller [addMeAsAmember function]: $e');
    }
  }

  Future<void> removeGroup(String groupId) async {
    final response = await supabase.from('group').delete().eq('id', groupId);
    if (response.error != null) {
      state = AsyncValue.error(response.error!, StackTrace.current);
    } else {
      getGroupData();
    }
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

  Future<void> deleteAgroup(String groupId) async {
    await supabase.from('group').delete().eq('group_id', groupId);
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
      },
    );
  }

  void fetchMyOwnGroups() {
    state = const AsyncValue.loading();
    try {
      subscription = supabase.from('group').stream(primaryKey: ['id']).listen((event) {
        final myGroups = event.map<Group>((e) => Group.fromJson(e)).toList();
        state = AsyncValue.data(myGroups);
      });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      log('Error from groupController <fetchMyOwnGroups>: $e');
    }
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
