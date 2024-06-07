import 'package:flutter/material.dart';

class BubblePopup extends StatelessWidget {
  final String logoPath;

  BubblePopup({required this.logoPath});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Bubble Info'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(logoPath, width: 100, height: 100),
          const SizedBox(height: 10),
          const Text('This is a custom popup for the bubble.'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
