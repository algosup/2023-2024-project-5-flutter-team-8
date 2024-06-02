import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Size size;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const RoundButton({
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
            borderRadius: BorderRadius.circular(70),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}