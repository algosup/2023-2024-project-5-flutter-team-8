import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:developer' as developer;

import '../redundancy/rectangle_button.dart';
import '../signup/chips.dart';

class UpdateSkillsPage extends StatefulWidget {
  const UpdateSkillsPage({super.key});

  @override
  State<UpdateSkillsPage> createState() => _UpdateSkillsPageState();
}

class _UpdateSkillsPageState extends State<UpdateSkillsPage> {
  final _formKey = GlobalKey<FormState>();
  String? _softSkillsNumberError;

  final List<String> skills = [
    "Self-Confidence",
    "Communication",
    "Judgment",
    "Empathy",
    "Efficiency",
    "Ability to focus",
    "Time management",
    "Stress management",
    "Sense of priorities",
    "Being organized",
    "Know how to organize",
    "Ability to concentrate",
    "Meeting deadlines",
    "Pressure handling",
    "Process optimization",
    "Ability to delegate / entrust",
    "Problem solving",
    "File management",
    "Teamwork",
    "Team Spirit",
    "Sense of service",
    "Coordination",
    "Ability to inspire confidence",
    "Being engaged",
    "Ability to create human relationships",
    "Cooperation & collaboration",
    "Flexibility",
    "Adaptability (when facing changes)",
    "Being open to changes",
    "Self-reflective",
    "Anticipation",
    "Innovation",
    "Creativity",
    "Optimism",
    "Self-improvement",
    "Getting out of comfort-zone",
    "Audacity",
    "Curiosity",
    "Risk-taking"
  ];

  List<String> selectedSkills = [];

  @override
  void dispose() {
    super.dispose();
  }

  void onSelectionChanged(List<String> newSelectedSkills) {
    setState(() {
      selectedSkills = newSelectedSkills;
    });
  }
  
  Future<void> _saveSelectedSkills() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/data.json';
      final file = File(filePath);

      if (await file.exists()) {
        final data = await file.readAsString();
        final dynamic parsedData = jsonDecode(data);

        if (parsedData is Map<String, dynamic>) {
          final Map<String, dynamic> jsonData = parsedData;

          if (jsonData.containsKey('users') && jsonData['users'] is Map<String, dynamic>) {
            final users = jsonData['users'] as Map<String, dynamic>;
            if (users.containsKey('1') && users['1'] is Map<String, dynamic>) {
              final user = users['1'] as Map<String, dynamic>;
              user['softSkills'] = selectedSkills;

              await file.writeAsString(jsonEncode(jsonData));
              developer.log('data.json content: $jsonData', name: 'SaveSelectedSkills');
            } else {
              developer.log('Error: User with ID 1 not found or invalid format', name: 'SaveSelectedSkills');
            }
          } else {
            developer.log('Error: Users data not found or invalid format', name: 'SaveSelectedSkills');
          }
        } else {
          developer.log('Error: Parsed data is not a Map<String, dynamic>', name: 'SaveSelectedSkills');
        }
      }
    } catch (e) {
      developer.log('Error: $e', name: 'SaveSelectedSkills');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 30,
            ),
            Row(
              children: [
                const Text(
                  'Add Skills',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                Text(
                  '(${selectedSkills.length}/15)',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    height: 2.5,
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
                  SizedBox(
                    height: size.height * 0.55,
                    child: ChipsWidget(
                      skills: skills,
                      selectedSkills: selectedSkills,
                      onSelectionChanged: onSelectionChanged,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SaveButton(
                            context: context,
                            formKey: _formKey,
                            onError: (error) {
                              setState(() {
                                _softSkillsNumberError = error;
                              });
                            },
                            size: size,
                            onPressed: () async {
                              if (selectedSkills.length == 15) {
                                await _saveSelectedSkills();
                                GoRouter.of(context).push('/newRankingSkills');
                              } else {
                                setState(() {
                                  _softSkillsNumberError = 'Please select 15 soft skills';
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (_softSkillsNumberError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _softSkillsNumberError!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SaveButton extends PurpleRectangleButton {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final Function(String?) onError;

  const SaveButton({
    super.key,
    required super.size,
    required this.context,
    required this.formKey,
    required this.onError,
    required super.onPressed,
  }) : super(text: 'SAVE');
}
