import 'package:flutter/material.dart';
import '../constants.dart';

class BubbleFooter extends StatelessWidget {
  final VoidCallback onApply;
  final VoidCallback onDenied;

  BubbleFooter({required this.onApply, required this.onDenied});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: purpleColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 65, // adjust the width of the button
            height: 60, // adjust the height of the button
            child: TextButton(
              onPressed: onApply,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  Text('Apply'),
                ],
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
              ),
            ),
          ),
        SizedBox(width: 70), // add space between the buttons
        Container(
            width: 75, // adjust the width of the button
            height: 60, // adjust the height of the button
            child: TextButton(
              onPressed: onDenied,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cancel, color: Colors.red),
                  Text('Denied'),
                ],
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
