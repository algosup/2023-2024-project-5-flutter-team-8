import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../redundancy/rectangle_button.dart';
import '../user.dart';

class CurrentSkillsPage extends StatefulWidget {
  const CurrentSkillsPage({super.key});

  @override
  State<CurrentSkillsPage> createState() => __CurrentSkillsPageStateState();
}

class __CurrentSkillsPageStateState extends State<CurrentSkillsPage> {
  late Future<User> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = loadUsers().then((users) => users.first);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<User>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading user data: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No user data found'));
          }

          final user = snapshot.data!;
          final skills = user.softSkills;

          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height / 30,
                ),
                const Row(
                  children: [
                    SizedBox(
                      child: Text(
                        'Skills (15)',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Wrap(
                        spacing: size.width * 0.04,
                        runSpacing: size.height * 0.01,
                        children: skills.map((skill) {
                          return Chip(
                            label: Text(skill),
                            backgroundColor: const Color.fromRGBO(203, 201, 212, 0.3),
                            side: const BorderSide(color: Color.fromRGBO(255, 255, 255, 0)),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                PurpleRectangleButton(
                  size: size,
                  text: 'Change',
                  onPressed: () {
                    GoRouter.of(context).push('/updateSkills');
                  },
                ),
                SizedBox(
                  height: size.height / 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
