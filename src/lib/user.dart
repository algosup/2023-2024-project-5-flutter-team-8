import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
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
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);

    final data = await file.readAsString();
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
