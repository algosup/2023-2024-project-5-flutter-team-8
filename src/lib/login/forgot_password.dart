import 'package:adopte_1_candidat/user.dart';
import 'package:adopte_1_candidat/login/login.dart';
import 'package:flutter/material.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';
import 'package:adopte_1_candidat/redundancy/text_fields.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? _emailError;
  late Future<List<User>> _usersFuture;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _usersFuture = loadUsers();
    _usersFuture.then((users) {
      setState(() {
        _users = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: FutureBuilder<List<User>>(
          future: _usersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              _users = snapshot.data!;
              return Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold,
                            height: 2.3,
                          ),
                        ),
                        const Text(
                          'To reset your password, you need your email or mobile number that can be authenticated.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          height: size.height * 0.33,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/forgot_password.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: SizedBox(
                            width: size.width * 0.9,
                            child: Column(
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
                                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                                  child: EmailField(
                                    controller: _emailController,
                                    errorText: _emailError,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResetPasswordButton(
                          size: size,
                          context: context,
                          emailController: _emailController,
                          formKey: _formKey,
                          onError: (String? error) {
                            setState(() {
                              _emailError = error;
                            });
                          },
                          users: _users,
                        ),
                        SizedBox(height: size.height / 48),
                        PurpleRectangleButton(
                          size: size,
                          text: 'BACK TO LOGIN',
                          onPressed: () {
                            GoRouter.of(context).go('/login');
                          },
                        ),
                        SizedBox(height: size.height / 24),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No user data found'));
            }
          },
        ),
      ),
    );
  }
}

class ResetPasswordButton extends BlackRectangleButton {
  final BuildContext context;
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  final Function(String?) onError;
  final List<User> users;

  ResetPasswordButton({
    super.key,
    required super.size,
    required this.context,
    required this.emailController,
    required this.formKey,
    required this.onError,
    required this.users,
  }) : super(
          text: "Reset Password",
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              final email = emailController.text;

              final emailValid = isEmailValid(email, users);

              if (emailValid) {
                GoRouter.of(context).go('/verifyEmail');
              } else {
                onError('This e-mail cannot be found');
              }
            }
          },
        );
}
