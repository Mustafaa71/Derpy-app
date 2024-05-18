import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userControllerProvider = ChangeNotifierProvider<UserControllerNotifier>((ref) {
  return UserControllerNotifier();
});

class UserControllerNotifier extends ChangeNotifier {
  final supabase = Supabase.instance.client;

  /// Function to add the userId into [members ----> Group Table].
  Future<void> addUserIdToGroupMember(String currentUserId, String groupId) async {
    try {
      final response = await supabase.from('group').select('members').eq('group_id', groupId).single();
      final List<dynamic>? currentMembers = response['members'];

      if (currentMembers != null) {
        final List<dynamic> updatedMembers = [...currentMembers, currentUserId];
        final addValue = await supabase.from('group').update({'members': updatedMembers}).eq('group_id', groupId);
        log(addValue.toString());
        notifyListeners();
      } else {
        final List<dynamic> updatedMembers = [currentUserId];
        final addValue = await supabase.from('group').upsert({'members': updatedMembers}).eq('group_id', groupId);
        log(addValue.toString());
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
