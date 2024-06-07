import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adopte_1_candidat/constants.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNavBar({ super.key, this.selectedIndex = 0});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch(index){
      case 0: 
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/matches');
        break;
      case 2:
        GoRouter.of(context).go('/certifications');
        break;
      case 3:
        GoRouter.of(context).go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
              'assets/icons/home.svg',
              color: _selectedIndex == 0 ? Colors.black : purpleColor,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
              'assets/icons/matches.svg',
              color: _selectedIndex == 1 ? Colors.black : purpleColor,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
              'assets/icons/certifications.svg',
              color: _selectedIndex == 2 ? Colors.black : purpleColor,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
              'assets/icons/user.svg',
              color: _selectedIndex == 3 ? Colors.black : purpleColor,
              ),
            ),
            label: '',
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
    );
  }
}