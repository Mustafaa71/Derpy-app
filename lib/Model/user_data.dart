class UserData {
  final String id;
  final String userName;
  final String name;
  final String phoneNumber;
  final String profileImage;
  final List<String> events;
  final List<String> groups;
  UserData({
    required this.id,
    required this.userName,
    required this.name,
    required this.phoneNumber,
    required this.profileImage,
    required this.events,
    required this.groups,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      userName: json['userName'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
      events: (json['events'] as List<String>).map((event) => event.toString()).toList(),
      groups: (json['groups'] as List<String>).map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'uuid': id,
      // 'user_name': userName,
      // 'name': name,
      // 'phone_number': phoneNumber,
      // 'profile_image': profileImage,
      'events': events,
      'groups': groups,
    };
  }
}
