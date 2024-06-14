import 'package:flutter/material.dart';

class SuccessPopup extends StatelessWidget {
  final String message;

  SuccessPopup({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text('Congratulations!', style: TextStyle(color: Colors.green)),
      content: Text(
        message,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('OK'),
        ),
      ],
    );
  }
}
