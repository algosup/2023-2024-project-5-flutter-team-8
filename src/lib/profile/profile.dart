import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../redundancy/profile_button.dart';
import '../redundancy/navigation_bar.dart';
import '../redundancy/rectangle_button.dart';
import '../user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          return SizedBox(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: size.width * 2,
                      height: size.height / 3.7,
                      child: SvgPicture.asset('assets/img/background.svg',
                          fit: BoxFit.fill),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: size.width / 1.5,
                      height: size.height / 3.7,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height / 20,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              height: 72,
                              child: SvgPicture.asset(
                                user.avatar,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                user.fullName,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    const TextStyle(color: backgroundColor, fontSize: 20),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                user.location,
                                style: const TextStyle(color: backgroundColor),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: size.height / 20,
                              width: size.width / 3,
                              margin: const EdgeInsets.only(top: 5.0, left: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: TextButton(
                                onPressed: () => GoRouter.of(context)
                                    .push('/updateProfilePicture'),
                                child: const Center(
                                  child: Text(
                                    'Change Image',
                                    style: TextStyle(color: backgroundColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        profileButton(
                            context,
                            'Personal Information',
                            'assets/icons/personal_information_logo.svg',
                            '/personalInformationPage'),
                        profileButton(context, 'Skills',
                            'assets/icons/skills_logo.svg', '/currentSkillsPage'),
                        profileButton(context, 'Certifications',
                            'assets/icons/certifications.svg', '/certificationProfilePage'),
                        profileButton(
                            context,
                            'Notifications',
                            'assets/icons/notification_logo.svg',
                            '/notificationPage'),
                        profileButton(context, 'Jobs Liked',
                            'assets/icons/likes_logo.svg', '/jobsLikedPage'),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 308,
                                  color: backgroundColor,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        const Column(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text('Log out', style: TextStyle(fontWeight: FontWeight.bold),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('Are you sure you want to leave?'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            BlackRectangleButton(
                                              size: size,
                                              text: 'YES',
                                              onPressed: () {
                                                GoRouter.of(context).go('/login');
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            PurpleRectangleButton(
                                              size: size,
                                              text: 'CANCEL',
                                              onPressed: () => Navigator.pop(context),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: size.width,
                            height: size.height / 11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  width: 60,
                                  height: 60,
                                  child: SvgPicture.asset(
                                    'assets/icons/logout_logo.svg',
                                    color: purpleColor,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 4 * 3 - 24,
                                  child: const Text(
                                    'Logout',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }
}
