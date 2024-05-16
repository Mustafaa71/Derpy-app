import 'dart:developer';

import 'package:derpy/Model/group.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final dashboardControllerProvider = ChangeNotifierProvider<DashboardController>((ref) {
  return DashboardController();
});

class DashboardController extends ChangeNotifier {
  final supabase = Supabase.instance.client;
  bool isLoading = false;
  List<Group> ownGroups = [];
  List<Group> myGroupAsMember = [];

  void fetchMyOwnGroups(String currentUserId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await supabase.from('group').select().eq('admin_id', currentUserId);
      ownGroups = (response).map((e) => Group.fromJson(e)).toList();
    } catch (e) {
      log('Error fetching own groups: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void fetchMyGroupsAsMember(String currentUserId) async {
    isLoading = true;
    notifyListeners();
    log('Fetching groups as member...');

    try {
      log('Fetching for user ID: $currentUserId');

      final response = await supabase.from('user').select('member_of').eq('id', currentUserId).single();
      log('Received user groups data: $response');

      if (response['member_of'] != null) {
        List<String> memberOfList = List<String>.from(response['member_of'] ?? []);
        log('Member of list for user $currentUserId: $memberOfList');

        List<Group> allGroups = [];

        for (var groupId in memberOfList) {
          log('Fetching group details for group ID: $groupId');
          final groupResponse = await supabase.from('group').select().eq('group_id', groupId).single();

          Group group = Group.fromJson(groupResponse);
          allGroups.add(group);
          log('Group added to member list: $group');
        }

        myGroupAsMember = allGroups;
      }
    } catch (e) {
      log('Error during fetchMyGroupsAsMember: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
