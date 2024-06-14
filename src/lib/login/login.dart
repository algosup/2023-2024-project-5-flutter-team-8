import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as developer;

import 'package:adopte_1_candidat/user.dart';
import 'package:adopte_1_candidat/redundancy/text_fields.dart';
import 'package:adopte_1_candidat/login/checkbox.dart';
import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';

import '../constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  String? _emailPasswordError;
  late Future<List<User>> _usersFuture;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _usersFuture = loadUsers();
    _usersFuture.then((users) {
      setState(() {
        _users = users;
      });
    });
  }

  @override
  void dispose() {
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
        child: FutureBuilder<List<User>>(
          future: _usersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              _users = snapshot.data!;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.15),
                      const Text(
                        'Welcome Back',
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
                      SizedBox(height: size.height * 0.08),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                            child: EmailField(
                              controller: _emailController,
                              errorText: _emailPasswordError,
                            ),
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
                            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                            child: PasswordField(
                              controller: _passwordController,
                              errorText: _emailPasswordError,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomCheckbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  GoRouter.of(context).go('/forgotPassword');
                                },
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(Colors.transparent), // Remove splash effect
                                ),
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                        ],
                      ),
                      LoginButton(
                        context: context,
                        size: size,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        formKey: _formKey,
                        onError: (String? error) {
                          setState(() {
                            _emailPasswordError = error;
                          });
                        },
                        users: _users,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'You don\'t have an account yet?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context).go('/signup');
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent), // Remove splash effect
                            ),
                            child: const Text(
                              'Sign Up',
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
                ),
              );
            } else {
              return const Center(child: Text('No user data found'));
            }
          },
        ),
      ),
    );
  }
}

bool isEmailValid(String email, List<User> users) {
  for (var user in users) {
    developer.log('user.email: ${user.email}');
    if (user.email.trim().toLowerCase() == email.trim().toLowerCase()) {
      return true;
    }
  }
  return false;
}

bool isPasswordValid(String password, List<User> users) {
  for (var user in users) {
    developer.log('user.password: ${user.password}');
    if (user.password == password) {
      return true;
    }
  }
  return false;
}

class LoginButton extends BlackRectangleButton {
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final Function(String?) onError;
  final List<User> users;

  LoginButton({
    super.key,
    required super.size,
    required this.context,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.onError,
    required this.users,
  }) : super(
          text: 'Log In',
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              final email = emailController.text;
              final password = passwordController.text;

              final emailValid = isEmailValid(email, users);
              final passwordValid = isPasswordValid(password, users);

              if (emailValid && passwordValid) {
                GoRouter.of(context).go('/home');
              } else {
                onError('Email or password is incorrect');
              }
            }
          },
        );
}


