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
        title: Text('Home'),
      ),
       body: Stack(
        children: [
          BubblesWidget(bubbleCount: 6),
          // Add other widgets for your home page here
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}
 