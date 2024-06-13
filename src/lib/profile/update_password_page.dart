import 'package:adopte_1_candidat/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../redundancy/rectangle_button.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController previousPasswordController =
        TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

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
                    'Update Password',
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
                        'Old Password',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  passwordInfo(context, previousPasswordController),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                      child: const Text(
                        'New Password',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  passwordInfo(context, newPasswordController),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                      child: const Text(
                        'Confirm Password',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  passwordInfo(context, confirmPasswordController),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            SizedBox(
              child: BlackRectangleButton(
                size: size,
                text: 'UPDATE',
                onPressed: () {
                  GoRouter.of(context).push('/personalInformationPage');
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

class PasswordInfo extends StatefulWidget {
  final TextEditingController controller;

  const PasswordInfo({
    super.key,
    required this.controller,
  });

  @override
  State<PasswordInfo> createState() => _PasswordInfoState();
}

class _PasswordInfoState extends State<PasswordInfo> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          height: 50,
          child: TextFormField(
            controller: widget.controller,
            obscureText: obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Password',
              filled: true,
              fillColor: backgroundColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: purpleColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget passwordInfo(BuildContext context, TextEditingController controller) {
  return PasswordInfo(controller: controller);
}
