class Event {
  final String id;
  final String eventId;
  final String adminId;
  final String name;
  final String description;
  final String category;
  final DateTime date;
  final DateTime timeStart;
  final DateTime timeEnd;
  final String location;
  final List<String> members;
  final int numberOfMembers;
  final int price;
  final bool cancelEvent;

  Event({
    required this.id,
    required this.eventId,
    required this.adminId,
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
      id: json['id'],
      eventId: json['event_id'],
      adminId: json['admin_id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      date: DateTime.parse(json['date']),
      timeStart: DateTime.parse(json['time_start']),
      timeEnd: DateTime.parse(json['time_end']),
      location: json['location'],
      members: List<String>.from(json['members']),
      numberOfMembers: json['number_of_members'],
      price: json['price'],
      cancelEvent: json['cancel_event'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_id': eventId,
      'admin_id': adminId,
      'name': name,
      'description': description,
      'category': category,
      'date': date.toIso8601String(),
      'time_start': timeStart.toIso8601String(),
      'time_end': timeEnd.toIso8601String(),
      'location': location,
      'members': members,
      'number_of_members': numberOfMembers,
      'price': price,
      'cancel_event': cancelEvent,
    };
  }
}
