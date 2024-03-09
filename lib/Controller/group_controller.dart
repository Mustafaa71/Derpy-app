import 'package:derpy/Model/event.dart';
import 'package:derpy/Model/group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupController extends StateNotifier<AsyncValue> {
  final supabase = Supabase.instance.client;
  static final groupControllerProvider = StateNotifierProvider<GroupController, AsyncValue>((ref) {
    return GroupController();
  });
  GroupController() : super(const AsyncLoading());

  Future<void> createGroup(
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
