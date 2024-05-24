import 'package:adopte_1_candidat/login/email_field.dart';
import 'package:adopte_1_candidat/login/password_field.dart';
import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
                        vertical: size.height * 0.01,),
                      child: emailField(_emailController, size),
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
                    PasswordField(controller: _passwordController),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    rectangleButton(_formKey),
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
