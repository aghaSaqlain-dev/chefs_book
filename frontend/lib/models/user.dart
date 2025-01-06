import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String profilePictureUrl;
  final String phone;
  final List<String> specialties;
  final int experienceYears;
  final String currentRole;
  final String location;
  final String restaurantName;
  final String restaurantLocation;
  final String restaurantWebsite;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.profilePictureUrl,
    required this.phone,
    required this.specialties,
    required this.experienceYears,
    required this.currentRole,
    required this.location,
    required this.restaurantName,
    required this.restaurantLocation,
    required this.restaurantWebsite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'profilePictureUrl': profilePictureUrl,
      'phone': phone,
      'specialties': specialties,
      'experienceYears': experienceYears,
      'currentRole': currentRole,
      'location': location,
      'restaurantName': restaurantName,
      'restaurantLocation': restaurantLocation,
      'restaurantWebsite': restaurantWebsite,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
      phone: map['phone'] ?? '',
      specialties: List<String>.from(map['specialties'] ?? []),
      experienceYears: map['experienceYears'] ?? 0,
      currentRole: map['currentRole'] ?? '',
      location: map['location'] ?? '',
      restaurantName: map['restaurantName'] ?? '',
      restaurantLocation: map['restaurantLocation'] ?? '',
      restaurantWebsite: map['restaurantWebsite'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? profilePictureUrl,
    String? phone,
    List<String>? specialties,
    int? experienceYears,
    String? currentRole,
    String? location,
    String? restaurantName,
    String? restaurantLocation,
    String? restaurantWebsite,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      phone: phone ?? this.phone,
      specialties: specialties ?? this.specialties,
      experienceYears: experienceYears ?? this.experienceYears,
      currentRole: currentRole ?? this.currentRole,
      location: location ?? this.location,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantLocation: restaurantLocation ?? this.restaurantLocation,
      restaurantWebsite: restaurantWebsite ?? this.restaurantWebsite,
    );
  }
}
