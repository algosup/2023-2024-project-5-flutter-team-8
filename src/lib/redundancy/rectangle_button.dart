import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final Size size;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const RectangleButton({
    super.key,
    required this.size,
    required this.color,
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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class BlackRectangleButton extends RectangleButton {
  const BlackRectangleButton({
    Key? key,
    required Size size,
    required String text,
    required VoidCallback onPressed,
  }) : super(
          key: key,
          size: size,
          color: Colors.black,
          text: text,
          onPressed: onPressed,
        );
}

class PurpleRectangleButton extends RectangleButton {
  const PurpleRectangleButton({
    Key? key,
    required Size size,
    required String text,
    required VoidCallback onPressed,
  }) : super(
          key: key,
          size: size,
          color: Colors.purple,
          text: text,
          onPressed: onPressed,
        );
}