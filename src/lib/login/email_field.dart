import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:adopte_1_candidat/constants.dart';

Widget emailField(TextEditingController controller, Size size) {
  return SizedBox(
    height: size.height * 0.1,
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'name@example.com',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: purpleColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      obscureText: false, // Email fields should not be obscure
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        } else if (value.length < 6) {
          return 'Email must be at least 6 characters';
        }
        return null;
      },
    )
  );
}
