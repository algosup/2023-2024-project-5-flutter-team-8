import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../constants.dart';
import '../database.dart';
import '../redundancy/round_button.dart';

class SelectSoftSkills extends StatefulWidget {
  const SelectSoftSkills({super.key});

  @override
  _SelectSoftSkillsState createState() => _SelectSoftSkillsState();
}

class _SelectSoftSkillsState extends State<SelectSoftSkills> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailPasswordError;

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

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
    return Chip(
      labelPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      shape: RoundedRectangleBorder(
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
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
                              Text(
                                'Soft Skills Selection',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '(2/15)',
                                style: TextStyle(
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
                              fullNameController: _fullNameController,
                              emailController: _emailController,
                              passwordController: _passwordController,
                              formKey: _formKey,
                              onError: (error) {
                                setState(() {
                                  _emailPasswordError = error;
                                });
                              },
                              size: size,
                            ),
                          ),
                        ],
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

bool isFullNameValid(String? value) {
  return value != null && value.isNotEmpty;
}

bool isEmailValid(String? value) {
  return value != null && value.isNotEmpty && value.contains('@');
}

bool isPasswordValid(String? value) {
  return value != null &&
      value.length >= 6 &&
      value.contains(RegExp(r'[0-9]')) &&
      value.contains(RegExp(r'[a-z]')) &&
      value.contains(RegExp(r'[A-Z]')) &&
      value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}

class ContinueButton extends RoundButton {
  final BuildContext context;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final Function(String?) onError;

  ContinueButton({
    super.key,
    required super.size,
    required this.context,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.onError,
  }) : super(
          color: purpleColor,
          text: 'Continue',
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              String fullName = fullNameController.text;
              String email = emailController.text;
              String password = passwordController.text;

              if (isFullNameValid(fullName) &&
                  isEmailValid(email) &&
                  isPasswordValid(password)) {
                users.add(User(fullName: fullName, email: email, password: password));
                GoRouter.of(context).push('/selectSoftskills');
              } else {
                onError('Please fill out all fields correctly');
              }
            }
          },
        );
}
