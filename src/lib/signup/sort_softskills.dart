import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:adopte_1_candidat/signup/chips.dart';

class SortSoftSkills extends StatefulWidget {
  const SortSoftSkills({super.key});

  @override
  _SortSoftSkillsState createState() => _SortSoftSkillsState();
}

class _SortSoftSkillsState extends State<SortSoftSkills> {
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
    final data = await file.readAsString();
    setState(() {
      skills = List<String>.from(jsonDecode(data));
      availableSkills.addAll(skills);
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
                          Row(
                            children: [
                              Text(
                                'Prioritize Your Soft Skills: \nFrom Mastery to Proficiency',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        numberColumn(),
                        Expanded(
                          child: DraggableChipsWidget(
                            skills: skills,
                            selectedSkills: selectedSkills,
                            onSelectionChanged: (value) {
                              setState(() {
                                selectedSkills = value;
                              });
                            },
                          ),
                        ),
                        TargetChipsWidget(
                          selectedSkills: selectedSkills,
                          availableSkills: availableSkills,
                          onSelectionChanged: (value) {
                            setState(() {
                              selectedSkills = value;
                            });
                          },
                        ),
                      ],
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

  Widget numberColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        15,
        (index) => Text(
          '.${index + 1}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
