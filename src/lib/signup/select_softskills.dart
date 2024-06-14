import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as developer;

import '../constants.dart';
import '../redundancy/round_button.dart';
import '../signup/chips.dart';
import '../redundancy/arrow_button.dart';  // Import the ArrowButton

class SelectSoftSkills extends StatefulWidget {
  const SelectSoftSkills({super.key});

  @override
  _SelectSoftSkillsState createState() => _SelectSoftSkillsState();
}

class _SelectSoftSkillsState extends State<SelectSoftSkills> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            LinearPercentIndicator(
              width: size.width,
              percent: 0.4,
              animation: true,
              backgroundColor: Colors.black,
              progressColor: purpleColor,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: ArrowButton()
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Soft Skills',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Soft Skills Selection',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.65,
                      child: Stack(
                        children: [
                          ChipsWidget(
                            skills: skills,
                            selectedSkills: selectedSkills,
                            onSelectionChanged: onSelectionChanged,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: ContinueButton(
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
                                  try {
                                    final directory =
                                        await getApplicationDocumentsDirectory();
                                    final filePath =
                                        '${directory.path}/data.json';
                                    final file = File(filePath);

                                    if (await file.exists()) {
                                      final content = await file.readAsString();
                                      final data = jsonDecode(content);

                                      int lastUserId = data["users"].length;
                                      data["users"]["$lastUserId"]
                                          ["softSkills"] = selectedSkills;

                                      await file
                                          .writeAsString(jsonEncode(data));
                                      developer.log(
                                          'data.json content: ${await file.readAsString()}',
                                          name: 'SaveUser');
                                      GoRouter.of(context)
                                          .push('/sortSoftSkills');
                                    } else {
                                      // Handle the case where the file does not exist
                                      developer.log('File does not exist',
                                          name: 'SelectSoftSkills');
                                    }
                                  } catch (e) {
                                    // Handle any errors that occur during file write
                                    developer.log('Error writing file',
                                        error: e, name: 'SelectSoftSkills');
                                  }
                                } else {
                                  // Handle the case where not enough skills are selected
                                  setState(() {
                                    _softSkillsNumberError =
                                        'Please select 15 soft skills';
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}

class ContinueButton extends RoundButton {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final Function(String?) onError;

  const ContinueButton({
    super.key,
    required super.size,
    required this.context,
    required this.formKey,
    required this.onError,
    required super.onPressed,
  }) : super(
          color: purpleColor,
          text: 'Continue',
        );
}
