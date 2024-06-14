import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';
import 'bubbles_widget.dart';
import '../user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = loadUsers().then((users) => users.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            User user = snapshot.data!;

            return Stack(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/img/top_home.svg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: false,
                      toolbarHeight: 150,
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hello,\n${user.fullName}!',
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0, bottom: 40.0),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SvgPicture.asset(
                              user.avatar,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: BubblesWidget(
                        bubbleCount: 7,
                        logos: const [
                          'assets/img/mcdo.png',
                          'assets/img/centre_val_de_loire.png',
                          'assets/img/fg_entreprise.png',
                          'assets/img/multis.png',
                          'assets/img/re.png',
                          'assets/img/we_are_evolution.png',
                          'assets/img/mcdo.png',
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(child: Text('No user data found'));
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}
