import 'package:adopte_1_candidat/constants.dart';
import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final Size size;
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  const RectangleButton({
    super.key,
    required this.size,
    required this.color,
    required this.textColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.7,
      height: size.height * 0.065,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class BlackRectangleButton extends RectangleButton {
  const BlackRectangleButton({
    super.key,
    required super.size,
    required super.text,
    required super.onPressed,
  }) : super(
          color: Colors.black,
          textColor: Colors.white,
        );
}

class PurpleRectangleButton extends RectangleButton {
  const PurpleRectangleButton({
    super.key,
    required super.size,
    required super.text,
    required super.onPressed,
  }) : super(
          color: purpleColor,
          textColor: Colors.black,
        );
}
