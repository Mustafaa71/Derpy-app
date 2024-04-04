import 'package:derpy/Model/event.dart';

class Group {
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
      admin: json['admin_id'],
      name: json['name'],
      description: json['description'],
      groupImage: json['group_image'],
      category: json['category'],
      location: json['location'],
      accessModifier: json['access_modifier'],
      members: List<String>.from(json['members']),
      events: (json['events']).map((eventJson) => Event.fromJson(eventJson)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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

  void addGroupToList(Group addGroup) {
    Fggg.gg.add(addGroup);
  }
}

class Fggg {
  static List<Group> gg = [];
}
