import 'package:flutter/material.dart';

Widget rectangleButton(GlobalKey<FormState> formKey) {
  return ElevatedButton(
    onPressed: () {
      if (formKey.currentState?.validate() ?? false) {
        // Perform the login action
      }
    },
    child: const Text('Login'),
  );
}
