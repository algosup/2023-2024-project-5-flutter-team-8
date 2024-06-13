import 'package:adopte_1_candidat/user.dart';
import 'package:adopte_1_candidat/redundancy/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import 'package:adopte_1_candidat/login/checkbox.dart';
import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
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
                SizedBox(
                  height: size.height * 0.08,
                ),
                Column(
                  children: [
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
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                          ),
                          child: EmailField(
                              controller: _emailController,
                              errorText: _emailPasswordError),
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
                          child: PasswordField(
                              controller: _passwordController,
                              errorText: _emailPasswordError),
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
                                overlayColor: WidgetStateProperty.all(
                                    Colors.transparent), // Remove splash effect
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
                        SizedBox(
                          height: size.height * 0.02,
                        ),
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
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
                            overlayColor: WidgetStateProperty.all(
                                Colors.transparent), // Remove splash effect
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool isEmailValid(String email) {
  for (var user in users) {
    if (user.email.trim().toLowerCase() == email.trim().toLowerCase()) {
      return true;
    }
  }
  return false;
}

bool isPasswordValid(String password) {
  for (var user in users) {
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

  LoginButton({
    super.key,
    required super.size,
    required this.context,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.onError,
  }) : super(
          text: 'Log In',
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              final email = emailController.text;
              final password = passwordController.text;

              final emailValid = isEmailValid(email);
              final passwordValid = isPasswordValid(password);

              if (emailValid && passwordValid) {
                GoRouter.of(context).go('/loading');
              } else {
                onError('Email or password is incorrect');
              }
            }
          },
        );
}
