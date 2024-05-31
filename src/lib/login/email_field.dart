import 'package:flutter/material.dart';

import 'package:adopte_1_candidat/constants.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;

  const EmailField({Key? key, required this.controller, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
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
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: purpleColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorText: errorText,
            ),
            obscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              } 
              return null;
            },
          ),
        ),
      ],
    );
  }
}
