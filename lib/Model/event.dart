class Event {
  final String eventId;
  final String adminId;
  final String eventAvatar;
  final String name;
  final String description;
  final String category;
  final String date;
  final String timeStart;
  final String timeEnd;
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
      date: json['date'],
      timeStart: json['time_start'],
      timeEnd: json['time_end'],
      location: json['location'],
      members: List<String>.from(json['members']),
      numberOfMembers: json['number_of_members'],
      price: json['price'],
      cancelEvent: json['cancel_event'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'admin_id': adminId,
      'event_avatar': eventAvatar,
      'name': name,
      'description': description,
      'category': category,
      'date': date,
      'time_start': timeStart,
      'time_end': timeEnd,
      'location': location,
      'members': members,
      'number_of_members': numberOfMembers,
      'price': price,
      'cancel_event': cancelEvent,
    };
  }
}
