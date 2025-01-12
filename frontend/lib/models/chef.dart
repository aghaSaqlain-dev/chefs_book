import 'dart:convert';

class User {
  final String name;
  final String email;
  final String phone;
  final String profilePictureUrl;
  final List<String> specialties;
  final int experienceYears;
  final String currentRole;
  final String location;
  final double rating;
  final int worldRank;
  final String restaurantName;
  final String restaurantLocation;
  final String restaurantWebsite;
  final String password;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePictureUrl,
    required this.specialties,
    required this.experienceYears,
    required this.currentRole,
    required this.location,
    required this.rating,
    required this.worldRank,
    required this.restaurantName,
    required this.restaurantLocation,
    required this.restaurantWebsite,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'profilePictureUrl': profilePictureUrl,
      'specialties': specialties,
      'experienceYears': experienceYears,
      'currentRole': currentRole,
      'location': location,
      'rating': rating,
      'worldRank': worldRank,
      'restaurantName': restaurantName,
      'restaurantLocation': restaurantLocation,
      'restaurantWebsite': restaurantWebsite,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
      specialties: List<String>.from(map['specialties'] ?? []),
      experienceYears: map['experienceYears'] ?? 0,
      currentRole: map['currentRole'] ?? '',
      location: map['location'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      worldRank: map['worldRank'] ?? 0,
      restaurantName: map['restaurantName'] ?? '',
      restaurantLocation: map['restaurantLocation'] ?? '',
      restaurantWebsite: map['restaurantWebsite'] ?? '',
      password: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
