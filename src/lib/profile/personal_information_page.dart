import 'package:adopte_1_candidat/redundancy/text_fields.dart';
import 'package:adopte_1_candidat/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../redundancy/rectangle_button.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  double _currentSliderValue = 156;
  late Future<User> _userFuture;
  late User _user;

  @override
  void initState() {
    super.initState();
    _userFuture = loadUsers().then((users) => users.first);
    _userFuture.then((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController locationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            _user = snapshot.data!;
            fullNameController.text = _user.fullName;
            emailController.text = _user.email;
            passwordController.text = _user.password;

            return SingleChildScrollView(
              child: Container(
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
                            'Personal Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height / 20,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: const Text(
                              'Fullname',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: size.width,
                            child: FullName(controller: fullNameController)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding:
                                const EdgeInsets.only(top: 24.0, bottom: 16.0),
                            child: const Text(
                              'Password',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: size.width,
                          child: PasswordFieldProfile(controller: passwordController, context: context),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                            child: const Text(
                              'Email address',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: size.width,
                            child: EmailField(controller: emailController)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding:
                                const EdgeInsets.only(top: 24.0, bottom: 16.0),
                            child: const Text(
                              'Location',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: size.width,
                            child: Location(controller: locationController)),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 24.0, left: 8.0, right: 8.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('0km'), Text('200km')],
                          ),
                        ),
                        Slider(
                          activeColor: purpleColor,
                          value: _currentSliderValue,
                          max: 200,
                          divisions: 200,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    SizedBox(
                      child: BlackRectangleButton(
                        size: size,
                        text: 'SAVE',
                        onPressed: () {
                          GoRouter.of(context).push('/profile');
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
          } else {
            return const Center(child: Text('No user data found'));
          }
        },
      ),
    );
  }
}
