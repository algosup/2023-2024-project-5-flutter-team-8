import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:adopte_1_candidat/routes.dart';
import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';
import 'bubbles_widget.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hello,\nJohn Doe!',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'DM Sans',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 80,
              height: 80,
              child: SvgPicture.asset('assets/iconProfile/lion.svg'),
            ),
          ),
        ],
      ),
       body: Stack(
        children: [
          BubblesWidget(bubbleCount: 6),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}
 