import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class User {
  final String fullName;
  final String email;
  final String password;
  final List<String> softSkills;
  final String avatar;

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.softSkills,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      softSkills: List<String>.from(json['softSkills']),
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'softSkills': softSkills,
      'avatar': avatar,
    };
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
    avatar: 'assets/iconProfile/cat.svg',
  ),
];

Future<User> loadUserData() async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);
    if (await file.exists()) {
      final data = await file.readAsString();
      final Map<String, dynamic> jsonData = jsonDecode(data);

      if (jsonData.containsKey('users')) {
        final users = jsonData['users'] as Map<String, dynamic>;
        if (users.containsKey('1')) {
          final userData = users['1'];
          return User.fromJson(userData);
        } else {
          throw Exception("User with ID 1 not found");
        }
      } else {
        throw Exception("No users found in JSON");
      }
    } else {
      throw Exception("File not found");
    }
  } catch (e) {
    print("Error loading user data: $e");
    rethrow;
  }
}