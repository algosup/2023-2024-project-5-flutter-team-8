import 'package:flutter/material.dart';

class SortSoftSkillsPage extends StatefulWidget {
  const SortSoftSkillsPage({Key? key, required this.softSkills}) : super(key: key);

  final List<String> softSkills;

  @override
  _SortSoftSkillsPageState createState() => _SortSoftSkillsPageState();
}

class _SortSoftSkillsPageState extends State<SortSoftSkillsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort Soft Skills'),
      ),
      body: ListView.builder(
        itemCount: widget.softSkills.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.softSkills[index]),
          );
        },
      ),
    );
  }
}
