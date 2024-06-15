import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../redundancy/rectangle_button.dart';
import '../user.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late Future<User> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = loadUsers().then((users) => users.first);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<User>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Error loading user data: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No user data found'));
          }
          final user = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.08,
                  ),
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
                  Text(
                    user.email,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                    onPressed: () {
                      GoRouter.of(context).go('/verificationSuccessful');
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
                    height: size.height / 48,
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
                          decorationColor: purpleColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
