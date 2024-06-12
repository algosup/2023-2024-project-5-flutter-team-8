import 'package:flutter/material.dart';

class ConfirmationPopup extends StatelessWidget {
  final VoidCallback onConfirm;
  final Icon icon;

  ConfirmationPopup({required this.onConfirm, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Row(
        children: [
          icon,
          SizedBox(width: 10),
          Text('Are you sure?', style: TextStyle(color: Colors.red)),
        ],
      ),
      content: Text(
        'Do you really want to deny this job offer?',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the confirmation dialog
            _showAcknowledgmentPopup(context); // Show acknowledgment message
          },
          child: Text('Yes, deny'),
        ),
      ],
    );
  }

  // Show acknowledgment popup after denying the job
  void _showAcknowledgmentPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text('Job Denied', style: TextStyle(color: Colors.red)),
          content: Text(
            'You have denied the job offer.',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
