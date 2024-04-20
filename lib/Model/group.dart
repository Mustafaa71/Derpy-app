import 'package:derpy/Model/event.dart';

class Group {
  final String id;
  final String admin;
  final String name;
  final String description;
  final String groupImage;
  final String category;
  final String location;
  final bool accessModifier;
  final List<String> members;
  final List<Event> events;

  Group({
    required this.id,
    required this.admin,
    required this.name,
    required this.description,
    required this.groupImage,
    required this.category,
    required this.location,
    required this.accessModifier,
    required this.members,
    required this.events,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['group_id'],
      admin: json['admin_id'],
      name: json['name'],
      description: json['description'],
      groupImage: json['group_image'],
      category: json['category'],
      location: json['location'],
      accessModifier: json['access_modifier'],
      members: List<String>.from(json['members']),
      events: (json['events'] != null)
          ? List<Event>.from(json['events'].map((eventJson) => Event.fromJson(eventJson)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'group_id': id,
      'admin_id': admin,
      'name': name,
      'description': description,
      'group_image': groupImage,
      'category': category,
      'location': location,
      'access_modifier': accessModifier,
      'members': members,
      'events': events.map((event) => event.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Group(Group id: $id, $admin, name: $name, description: $description, groupImage: $groupImage, category: $category, location: $location, accessModifier: $accessModifier, members: $members, events: $events)';
  }
}
