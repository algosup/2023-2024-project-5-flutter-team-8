import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as developer;

class SortSoftSkills extends StatefulWidget {
  const SortSoftSkills({super.key});

  @override
  _SortSoftSkillsState createState() => _SortSoftSkillsState();
}

class _SortSoftSkillsState extends State<SortSoftSkills> {
  List<String> skills = [];

  @override
  void initState() {
    super.initState();
    _loadSkills();
  }

  Future<void> _loadSkills() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/data.json';
      final file = File(filePath);
      final data = await file.readAsString();
      setState(() {
        skills = List<String>.from(jsonDecode(data));
      });
    } catch (e) {
      developer.log('Error reading file', error: e, name: 'SortSoftSkills');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort Soft Skills'),
      ),
      body: skills.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ReorderableListView(
              children: skills
                  .map((skill) => ListTile(
                        key: ValueKey(skill),
                        title: Text(skill),
                        trailing: const Icon(Icons.drag_handle),
                      ))
                  .toList(),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final String item = skills.removeAt(oldIndex);
                  skills.insert(newIndex, item);
                });
              },
            ),
    );
  }
}
