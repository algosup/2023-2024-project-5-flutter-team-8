import 'package:flutter/material.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void openMailApp() {}

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Check Your Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    height: 2.3,
                  ),
                ),
                const Text(
                  'We\'ve sent an e-mail to the e-mail address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const Text(
                  'lorem.ispum@dolor.sit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.45,
                  child: SvgPicture.asset(
                    'assets/img/check_email.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                BlackRectangleButton(
                  size: size,
                  text: 'OPEN YOUR EMAIL',
                  onPressed: openMailApp,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'You have not received the email?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 48,
                    ),
                    const Text(
                      'Resend',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: purpleColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
