import 'package:adopte_1_candidat/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../redundancy/rectangle_button.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  double _currentSliderValue = 156;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController locationController = TextEditingController();

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
                    'Personal Information',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: const Text(
                        'Fullname',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  personalInfo(
                      context, fullNameController, users.first.fullName),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                      child: const Text(
                        'Password',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: size.width,
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width - 60,
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              fillColor: backgroundColor,
                              border: InputBorder.none,
                              hintText: '',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => GoRouter.of(context)
                              .push('/updatePasswordPage'),
                          child: const Icon(Icons.keyboard_arrow_right),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                      child: const Text(
                        'Email address',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  personalInfo(context, emailController, users.first.email),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                      child: const Text(
                        'Location',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  personalInfo(context, locationController, 'Paris, France'),
                  Container(
                    padding: const EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('0km'),
                        Text('200km')
                      ],
                    ),
                  ),
                  Slider(
                    activeColor: purpleColor,           
                    value: _currentSliderValue,
                    max: 200,
                    divisions: 200,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            SizedBox(
              child: BlackRectangleButton(
                size: size,
                text: 'SAVE',
                onPressed: () {
                  GoRouter.of(context).push('/profile');
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

Widget personalInfo(
    BuildContext context, TextEditingController controller, String users) {
  final size = MediaQuery.of(context).size;
  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    width: size.width,
    height: 40,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: backgroundColor,
        border: InputBorder.none,
        hintText: users,
      ),
    ),
  );
}
