import 'dart:async';
import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final eventControllerProvider = StateNotifierProvider<EventController, AsyncValue>((ref) {
  return EventController();
});

class EventController extends StateNotifier<AsyncValue> {
  final supabase = Supabase.instance.client;
  StreamSubscription? subscription;

  EventController() : super(const AsyncValue.loading());

  /// Function to add eventId to Group [events ---> Group Table]
  Future<void> addEventtoGroup(groupId, eventId) async {
    try {
      final response = await supabase.from('group').select('events').eq('group_id', groupId).single();
      final List<dynamic>? events = response['events'];

      if (events != null) {
        final List<dynamic> updatedEvents = [...events, eventId];
        final addEvents = await supabase.from('group').update({'events': updatedEvents}).eq('group_id', groupId);
        log(addEvents.toString());
        state = AsyncData(addEvents);
      } else {
        final List<dynamic> updatedEvents = [eventId];
        final addValue = await supabase.from('group').upsert({'events': updatedEvents}).eq('group_id', groupId);
        state = AsyncData(addValue);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription!.cancel();
    super.dispose();
  }
}
