import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../routes.dart';
import '../constants.dart';
import '../redundancy/round_button.dart';

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

  Widget chips() {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 2.0,
        children: skills.map((skill) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: chip(skill),
          );
        }).toList(),
      ),
    );
  }

  Widget chip(String label) {
  bool isSelected = selectedSkills.contains(label);
  return ChoiceChip(
    showCheckmark: false,
    labelPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
    label: Text(
      label,
      style: TextStyle(
        color: isSelected ? Colors.black : Colors.grey,
        fontSize: 12,
      ),
    ),
    backgroundColor: isSelected ? Colors.black : backgroundColor,
    selected: isSelected,
    onSelected: (selected) {
      setState(() {
        if (selected) {
          if (selectedSkills.length < 15) {
            selectedSkills.add(label);
          }
        } else {
          selectedSkills.remove(label);
        }
      });
    },
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: isSelected ? Colors.black : Colors.grey,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
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
            SizedBox(
              height: size.height * 0.05,
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
                          chips(),
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
                              onPressed: () {
                                if (selectedSkills.length == 15) {
                                  context.goNamed("sortSoftSkills", pathParameters: {
                                    'softSkills': selectedSkills.join(','),
                                  });
                                } else {
                                  // Handle the case where not enough skills are selected
                                  setState(() {
                                    _softSkillsNumberError = 'Please select 15 soft skills';
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
