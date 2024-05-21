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
  final List<String> events;

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
      events: List<String>.from(json['events']),
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
      'events': members
    };
  }
}
