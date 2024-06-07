import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';
import 'bubbles_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: false,
        toolbarHeight: 150,
        title: const Align(
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
            padding: const EdgeInsets.only(right: 25.0, bottom: 40.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.asset('assets/iconProfile/lion.svg',
                fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
       body: Stack(
        children: [
          BubblesWidget(bubbleCount: 7,
          logos: const [
              'assets/img/mcdo.png',
              'assets/img/centre_val_de_loire.png',
              'assets/img/fg_entreprise.png',
              'assets/img/multis.png',
              'assets/img/re.png',
              'assets/img/we_are_evolution.png',
              'assets/img/mcdo.png',
            ],),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}
 