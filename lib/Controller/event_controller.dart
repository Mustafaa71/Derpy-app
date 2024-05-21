import 'dart:async';
import 'dart:developer';

import 'package:derpy/Model/event.dart';
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
  Future<void> addEventtoGroup(String groupId, String eventId) async {
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

  /// Function to add event_id to user table [events ----> user]

  Future<void> addEventIdToUserTable(String userId, String eventId) async {
    try {
      final response = await supabase.from('user').select('events').eq('id', userId).single();
      final List<dynamic>? events = response['events'];
      if (events != null) {
        final List<dynamic> updatedEvents = [...events, eventId];
        final addValue = await supabase.from('user').update({'events': updatedEvents}).eq('id', userId);
        log('response: $addValue');
      } else {
        final List<dynamic> updatedEvents = [eventId];
        final addValue = await supabase.from('user').upsert({'id': userId, 'events': updatedEvents}).eq('id', userId);
        log('response: $addValue');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  /// This function is used to view user evnts that he enroll in

  Future<List<String>> getUserEventsId(String currentUserId) async {
    try {
      final response = await supabase.from('user').select('events').eq('id', currentUserId).single();
      List<String> eventIds = [];
      if (response['events'] != null) {
        eventIds = List<String>.from(response['events']);
      }
      log('Event IDs: $eventIds');
      return eventIds;
    } catch (e) {
      log('Error fetching event IDs: $e');
      return [];
    }
  }

  Future<List<Event>> getUserEvents(String currentUserId) async {
    try {
      List<String> eventIds = await getUserEventsId(currentUserId);
      List<Event> events = [];

      for (var eventId in eventIds) {
        final response = await supabase.from('event').select().eq('event_id', eventId).single();
        events.add(Event.fromJson(response));
      }

      log('Events: $events');
      return events;
    } catch (e) {
      log('Error fetching events: $e');
      return [];
    }
  }

  /// This function is used to view group evnts that belong to group

  Future<List<String>> getGroupEventsId(String groupId) async {
    try {
      final response = await supabase.from('group').select('events').eq('group_id', groupId).single();
      List<String> eventIds = [];
      if (response['events'] != null) {
        eventIds = List<String>.from(response['events']);
      }
      log('Event IDs: $eventIds');
      return eventIds;
    } catch (e) {
      log('Error fetching event IDs: $e');
      return [];
    }
  }

  Future<List<Event>> getEventsBelongToGroup(String groupId) async {
    try {
      List<String> eventIds = await getGroupEventsId(groupId);
      List<Event> events = [];

      for (var eventId in eventIds) {
        final response = await supabase.from('event').select().eq('event_id', eventId).single();
        events.add(Event.fromJson(response));
      }

      log('Events: $events');
      return events;
    } catch (e) {
      log('Error fetching events: $e');
      return [];
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription!.cancel();
    super.dispose();
  }
}
