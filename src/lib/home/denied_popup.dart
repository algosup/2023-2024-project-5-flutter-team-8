// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ConfirmationPopup extends StatelessWidget {
  final VoidCallback onConfirm;

  ConfirmationPopup({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text('Are you sure?', style: TextStyle(color: Colors.red)),
      content: Text(
        'Do you really want to deny this job offer?',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cancel, color: Colors.red, size: 30,),
            Text('Cancel'),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the confirmation dialog
            onConfirm(); // Execute the confirmation action
          },
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 30,),
            Text('Confirm'),
            ],
          ),
        ),
      ],
    );
  }
}
