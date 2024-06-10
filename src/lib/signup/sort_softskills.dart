import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'chips.dart';
import '../constants.dart';

class SortSoftSkills extends StatefulWidget {
  const SortSoftSkills({super.key});

  @override
  _SortSoftSkillsState createState() => _SortSoftSkillsState();
}

class _SortSoftSkillsState extends State<SortSoftSkills> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              LinearPercentIndicator(
                width: size.width,
                percent: 0.6,
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
                              'Ranking',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Prioritize Your Soft Skills: \nFrom Mastery to Proficiency',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
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
                      SizedBox(height: size.height * 0.05),
                      ContinueButton(
                        selectedSkills: selectedSkills,
                        onPressed: () {
                          bool allFilled = selectedSkills.every((skill) => skill.isNotEmpty);
                          if (allFilled) {
                            GoRouter.of(context).go('/certifications');
                          } else {
                            setState(() {
                              _softSkillsNumberError = 'Please fill all soft skills';
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                        child: Center(
                          child: Text(
                            _softSkillsNumberError ?? '',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final List<String> selectedSkills;
  final VoidCallback onPressed;

  const ContinueButton({
    super.key,
    required this.selectedSkills,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: purpleColor,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      child: const Text('CONTINUE'),
    );
  }
}
