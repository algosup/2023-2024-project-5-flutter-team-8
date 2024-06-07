import 'package:flutter/material.dart';

class BubblePopup extends StatelessWidget {
  final String logoPath;

  BubblePopup({required this.logoPath});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(logoPath, width: 50, height: 50),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'McDonald\'s',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '62 Av. du 19 Mars 1962 CC HYPER U,\n18100 Vierzon, France',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Waiter',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Starts Jul 30, 2024',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum Lorem ipsum Lorem\nipsum Lorem ipsum Lorem ipsum\nLorem ipsum Lorem ipsum Lorem\nipsum Lorem ipsum Lorem ipsum\nLorem ipsum Lorem ipsum',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
