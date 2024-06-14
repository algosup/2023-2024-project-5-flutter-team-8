import 'package:flutter/material.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SuccessEmailUpdate extends StatefulWidget {
  const SuccessEmailUpdate({super.key});

  @override
  State<SuccessEmailUpdate> createState() => _SuccessEmailUpdateState();
}

class _SuccessEmailUpdateState extends State<SuccessEmailUpdate> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Success',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold,
                      height: 2.3,
                    ),
                  ),
                  const Text(
                    'Your password has been updated, please change your password regularly to avoid this happening',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.45,
                    child: SvgPicture.asset(
                      'assets/img/email_success.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  BlackRectangleButton(
                    size: size,
                    text: 'CONTINUE',
                    onPressed: () {
                      GoRouter.of(context).go('/home');
                    },
                  ),
                  SizedBox(
                    height: size.height / 48,
                  ),
                  PurpleRectangleButton(
                    size: size,
                    text: 'BACK TO LOGIN',
                    onPressed: () {
                      GoRouter.of(context).go('/login');
                    },
                  ),
                  SizedBox(
                    height: size.height / 24,
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
