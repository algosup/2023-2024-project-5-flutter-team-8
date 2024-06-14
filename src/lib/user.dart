import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class User {
  final String fullName;
  final String email;
  final String password;
  final List<String> softSkills;
  final String location;
  final String distance;
  final String avatar;

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.softSkills,
    required this.location,
    required this.distance,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      softSkills: List<String>.from(json['softSkills']),
      location: json['location'] as String,
      distance: json['distance'] as String,
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'softSkills': softSkills,
      'location': location,
      'distance': distance,
      'avatar': avatar,
    };
  }
}

Future<List<User>> loadUsers() async {
  try {
    // Read the JSON file from assets
    final data = await rootBundle.loadString('lib/redundancy/data.json');
    final Map<String, dynamic> jsonData = jsonDecode(data);

    if (jsonData.containsKey('users')) {
      final usersMap = jsonData['users'] as Map<String, dynamic>;
      final users = usersMap.values.map((user) => User.fromJson(user)).toList();
      return users;
    } else {
      throw Exception("No users found in JSON");
    }
  } catch (e) {
    print("Error loading user data: $e");
    rethrow;
  }
}

List<User> users = [
  User(
    fullName: 'Quentin Clément',
    email: 'quentin.clement@algosup.com',
    password: '12345',
    softSkills: [
      'Self-Confidence',
      'Communication',
      'Judgment',
      'Empathy',
      'Efficiency',
      'Ability to focus',
      'Time management',
      'Stress management',
      'Sense of priorities',
      'Being organized',
      'Know how to organize',
      'Ability to concentrate',
      'Meeting deadlines',
      'Pressure handling',
      'Process optimization'
    ],
    location: 'Paris',
    distance: '10 km',
    avatar: 'assets/iconProfile/cat.svg',
  ),
];
