import 'package:flutter/material.dart';
import 'bubbles_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BubblesWidget(bubbleCount: 6),
          // Add other widgets for your home page here
        ],
      ),
    );
  }
}

