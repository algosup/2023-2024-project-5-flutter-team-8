import 'dart:convert';
import 'dart:io';

import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../signup/chips.dart';

class NewRankingSkillsPage extends StatefulWidget {
  const NewRankingSkillsPage({super.key});

  @override
  State<NewRankingSkillsPage> createState() => _NewRankingSkillsPageState();
}

class _NewRankingSkillsPageState extends State<NewRankingSkillsPage> {
  String? _softSkillsNumberError;
  final _formKey = GlobalKey<FormState>();
  List<String> skills = [];
  List<String> selectedSkills = List.filled(15, '');
  List<String> availableSkills = [];

  @override
  void initState() {
    super.initState();
    _loadSkills();
  }

  Future<void> _loadSkills() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);
    if (await file.exists()) {
      final data = await file.readAsString();
      setState(() {
        skills = List<String>.from(jsonDecode(data));
        availableSkills = List.from(skills);
      });
    }
  }

  Future<void> _saveSkills() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);
    final data = jsonEncode(selectedSkills);
    await file.writeAsString(data);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                      'Ranking',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width,
                height: size.height / 20,
              ),
              Column(
                children: [
                  Column(
                    children: List.generate(
                      15,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              child: Text(
                                '.${index + 1}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Flexible(
                              flex: 5,
                              child: TargetChipsWidget(
                                index: index,
                                selectedSkills: selectedSkills,
                                availableSkills: availableSkills,
                                onSelectionChanged: (value) {
                                  setState(() {
                                    selectedSkills = value;
                                  });
                                },
                              ),
                            ),
                            const Spacer(),
                            if (index < availableSkills.length)
                              Flexible(
                                flex: 8,
                                child: DraggableChipsWidget(
                                  skill: availableSkills[index],
                                  onDragCompleted: (value) {
                                    setState(() {
                                      // Ensure that the dragged skill is removed only once
                                      if (availableSkills.contains(value)) {
                                        availableSkills.remove(value);
                                      }
                                    });
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 30,
              ),
              SizedBox(
                child: PurpleSaveButton(
                  text: 'SAVE',
                  size: size,
                  selectedSkills: selectedSkills,
                  onPressed: () async {
                    bool allFilled =
                        selectedSkills.every((skill) => skill.isNotEmpty);
                    if (allFilled) {
                      await _saveSkills();
                      GoRouter.of(context).go('/profile');
                    } else {
                      setState(() {
                        _softSkillsNumberError = 'Please fill all soft skills';
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PurpleSaveButton extends PurpleRectangleButton {
  final List<String> selectedSkills;

  const PurpleSaveButton({
    super.key,
    required super.size,
    required this.selectedSkills,
    required super.onPressed,
    required super.text,
  });
}