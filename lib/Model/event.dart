import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Event {
  final String eventId;
  final String adminId;
  final String eventAvatar;
  final String name;
  final String description;
  final String category;
  final DateTime date;
  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;
  final String location;
  final List<String> members;
  final String numberOfMembers;
  final String price;
  final bool cancelEvent;

  Event({
    required this.eventId,
    required this.adminId,
    required this.eventAvatar,
    required this.name,
    required this.description,
    required this.category,
    required this.date,
    required this.timeStart,
    required this.timeEnd,
    required this.location,
    required this.members,
    required this.numberOfMembers,
    required this.price,
    required this.cancelEvent,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['event_id'],
      adminId: json['admin_id'],
      eventAvatar: json['event_avatar'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      date: DateTime.parse(json['date']),
      timeStart: TimeOfDay(
          hour: int.parse(json['time_start'].split(":")[0]), minute: int.parse(json['time_start'].split(":")[1])),
      timeEnd:
          TimeOfDay(hour: int.parse(json['time_end'].split(":")[0]), minute: int.parse(json['time_end'].split(":")[1])),
      location: json['location'],
      members: List<String>.from(json['members']),
      numberOfMembers: json['number_of_members'],
      price: json['price'],
      cancelEvent: json['cancel_event'],
    );
  }

  Map<String, dynamic> toJson() {
    final dateFormat = DateFormat('yyyy-MM-dd'); // For date formatting
    final timeFormat = (TimeOfDay time) =>
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'; // For time formatting

    return {
      'event_id': eventId,
      'admin_id': adminId,
      'event_avatar': eventAvatar,
      'name': name,
      'description': description,
      'category': category,
      'date': dateFormat.format(date), // Convert DateTime to String
      'time_start': timeFormat(timeStart), // Convert TimeOfDay to String
      'time_end': timeFormat(timeEnd), // Convert TimeOfDay to String
      'location': location,
      'members': members,
      'number_of_members': numberOfMembers,
      'price': price,
      'cancel_event': cancelEvent,
    };
  }
}
