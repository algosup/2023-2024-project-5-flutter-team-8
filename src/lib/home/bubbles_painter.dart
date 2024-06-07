import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  final double bubbleRadius;

  BubblePainter({required this.bubbleRadius});

  @override
  void paint(Canvas canvas, Size size) {
    Paint fillPaint = Paint()..color = Colors.white;
    Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawCircle(Offset(bubbleRadius, bubbleRadius), bubbleRadius, fillPaint);
    canvas.drawCircle(Offset(bubbleRadius, bubbleRadius), bubbleRadius, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
