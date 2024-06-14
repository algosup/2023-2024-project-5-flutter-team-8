import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as developer;

import '../constants.dart';
import '../redundancy/text_fields.dart';
import '../redundancy/round_button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailPasswordError;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              percent: 0.2,
              animation: true,
              backgroundColor: Colors.black,
              progressColor: purpleColor,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Create an Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                        height: 2.5,
                      ),
                    ),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Full Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.01,
                              ),
                              child: FullName(controller: _fullNameController, errorText: _emailPasswordError),
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.01,
                              ),
                              child: EmailField(controller: _emailController, errorText: _emailPasswordError),
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.01,
                              ),
                              child: PasswordFieldSignup(controller: _passwordController, errorText: _emailPasswordError),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                        ContinueButton(
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
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'You already have an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context).go('/login');
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent), // Remove splash effect
                              ),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  color: purpleColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: purpleColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],)
        
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
  return value != null && value.length >= 6 && value.contains(RegExp(r'[0-9]')) && value.contains(RegExp(r'[a-z]')) && value.contains(RegExp(r'[A-Z]')) && value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}

Future<void> _saveUser(String fullName, String email, String password) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/data.json';
  final file = File(filePath);

  Map<String, dynamic> data = {
    "users": {
      "1": {
        "fullName": fullName,
        "email": email,
        "password": password,
        "softSkills": [],
        "distance": "",
        "location": "",
        "distance": "",
        "avatar": ""
      }
    }
  };

  await file.writeAsString(jsonEncode(data));
  developer.log('data.json content: ${await file.readAsString()}', name: 'SaveUser');
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
    onPressed: () async {
      if (formKey.currentState?.validate() ?? false) {
        String fullName = fullNameController.text;
        String email = emailController.text;
        String password = passwordController.text;
        if (isFullNameValid(fullName) && isEmailValid(email) && isPasswordValid(password)) {
          await _saveUser(fullName, email, password);
          GoRouter.of(context).push('/selectSoftskills');
        } else {
          onError('Please fill out all fields correctly');
        }
      }
    },
  );
}
