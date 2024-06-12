import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../redundancy/rectangle_button.dart';

class CurrentSkillsPage extends StatefulWidget {
  const CurrentSkillsPage({super.key});

  @override
  State<CurrentSkillsPage> createState() => __CurrentSkillsPageStateState();
}

class __CurrentSkillsPageStateState extends State<CurrentSkillsPage> {
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
                    spacing: size.width * 0.01,
                    children: List<Widget>.generate(
                      15,
                      (int index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              height: size.height * 0.05,
                              width: size.width * 0.22,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(203, 201, 212, 1),
                                borderRadius: BorderRadius.circular(10),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.1),
                                //     spreadRadius: 2,
                                //     blurRadius: 5,
                                //     offset: const Offset(
                                //         0, 3),
                                //   ),
                                // ],
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Lorem'),
                                  Icon(Icons.close)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            )
                          ],
                        );
                      },
                    ).toList(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            SizedBox(
              child: PurpleRectangleButton(
                size: size,
                text: 'Change',
                onPressed: () {
                  GoRouter.of(context).push('/updateSkills');
                },
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
          ],
        ),
      ),
    );
  }
}
