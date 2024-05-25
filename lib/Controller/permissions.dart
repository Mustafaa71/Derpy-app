import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final permissionsProvider = ChangeNotifierProvider<PermissionNotifier>((ref) {
  return PermissionNotifier();
});

class PermissionNotifier extends ChangeNotifier {
  final supabase = Supabase.instance.client;

  /// These functions are used to give a user permission regarding to Groups ...
  Future<List<String>> getCurrentUserEnrollment(String currentUserId) async {
    try {
      final response = await supabase.from('user').select('member_of').eq('id', currentUserId);

      log('response: $response');
      if (response.isNotEmpty) {
        return List<String>.from(response[0]['member_of']);
      } else {
        return [];
      }
    } catch (e) {
      log('Exception fetching users: $e');
      return [];
    }
  }

  Future<bool> hideJoinGroup(String currentUserId, String groupId) async {
    final enrollments = await getCurrentUserEnrollment(currentUserId);
    final response = await Supabase.instance.client.from('group').select('group_id, admin_id').eq('group_id', groupId);

    if (response.isNotEmpty) {
      var groupData = response[0];
      if (enrollments.contains(groupData['group_id']) || currentUserId == groupData['admin_id']) {
        return true;
      }
    }
    return false;
  }

  /// Function to events permissions ...

  Future<bool> hideJoinEvents(String currentUserId, String eventId) async {
    final response = await supabase.from('event').select('members').eq('event_id', eventId).single();
    final List<String> members = List.from(response['members']);

    if (members.isNotEmpty && members.contains(currentUserId)) {
      return true;
    }

    return false;
  }
}
