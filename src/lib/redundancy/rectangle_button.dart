import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:adopte_1_candidat/database.dart'; // Ensure this file contains the users list and User class

class RectangleButton extends StatelessWidget {
  final Size size;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const RectangleButton({
    Key? key,
    required this.size,
    required this.color,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.7,
      height: size.height * 0.065,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class BlackRectangleButton extends RectangleButton {
  const BlackRectangleButton({
    Key? key,
    required Size size,
    required String text,
    required VoidCallback onPressed,
  }) : super(
          key: key,
          size: size,
          color: Colors.black,
          text: text,
          onPressed: onPressed,
        );
}

class PurpleRectangleButton extends RectangleButton {
  const PurpleRectangleButton({
    Key? key,
    required Size size,
    required String text,
    required VoidCallback onPressed,
  }) : super(
          key: key,
          size: size,
          color: Colors.purple,
          text: text,
          onPressed: onPressed,
        );
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
    Key? key,
    required Size size,
    required this.context,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.onError,
  }) : super(
          key: key,
          size: size,
          text: 'Log In',
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              String email = emailController.text;
              String password = passwordController.text;

              bool emailValid = isEmailValid(email);
              bool passwordValid = isPasswordValid(password);

              if (emailValid && passwordValid) {
                GoRouter.of(context).go('/loading');
              } else {
                if (!emailValid && !passwordValid) {
                  onError('Email or password incorrect');
                }
              }
            }
          },
        );
}
