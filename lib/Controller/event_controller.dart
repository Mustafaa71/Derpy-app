import 'dart:async';

import 'package:derpy/Model/event.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventController extends StateNotifier<AsyncValue> {
  final supabase = Supabase.instance.client;
  final isLoading = useState<bool>(false);
  List<Event> eventList = [];

  static final eventControllerProvider = StateNotifierProvider<EventController, AsyncValue>((ref) {
    return EventController();
  });
  EventController() : super(const AsyncValue.loading());

  StreamSubscription<StreamSubscription>? getEvents() {
    isLoading.value = !isLoading.value;
    print(isLoading);
    return null;
  }
}
