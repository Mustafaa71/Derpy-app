import 'dart:developer';

import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Model/event.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class EventDashboard extends HookConsumerWidget {
  const EventDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const oddCardColor = Color(0xFF122932);
    const evenCardColor = Color(0xFF285943);
    final supabase = Supabase.instance.client;

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events Dashboard'),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<List<Event>>(
        future: getUserEvents(supabase.auth.currentUser!.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No events found.'));
          } else {
            final events = snapshot.data!;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                Color changeColorCard(int index) {
                  return (index % 2 == 0) ? oddCardColor : evenCardColor;
                }

                final event = events[index];
                final cardColor = changeColorCard(index);
                final eventAvatar = supabase.storage.from('Gg').getPublicUrl(event.eventAvatar);
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: WidgetCircularAnimator(
                              innerColor: Colors.white,
                              outerColor: Colors.blue,
                              innerAnimation: Curves.easeInOutBack,
                              outerAnimation: Curves.easeInOutBack,
                              size: 60,
                              innerAnimationSeconds: 10,
                              outerAnimationSeconds: 10,
                              child: Container(
                                decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xff034C5C),
                                  radius: 30,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(eventAvatar),
                                    radius: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          event.name,
                                          style: TextStyleManager(
                                              kColor: Colors.grey, kFontSize: 18.0, kFontWeight: FontWeight.bold),
                                          overflow: TextOverflow.visible,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Text(
                                        'Date: ${formatDate(event.date)}',
                                        style: TextStyleManager(
                                          kColor: Colors.grey,
                                          kFontSize: 15.0,
                                          kFontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4.0),
                                  const Divider(height: 3),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Price: ${event.price} SR',
                                    style: TextStyleManager(
                                      kColor: Colors.white,
                                      kFontSize: 15.0,
                                      kFontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Number of Members: ${event.numberOfMembers}',
                                        style: TextStyleManager(
                                          kColor: Colors.white,
                                          kFontSize: 15.0,
                                          kFontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

String formatDate(date) {
  DateFormat formatter = DateFormat('yyyy/MM/dd');
  return formatter.format(date);
}
