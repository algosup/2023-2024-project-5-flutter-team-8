import 'package:flutter/material.dart';

Widget notificationButton(BuildContext context, String name, bool isNotification) {
  return NotificationButton(
    name: name,
    isNotification: isNotification
  );
}

class NotificationButton extends StatefulWidget {
  final String name;
  final bool isNotification;

  const NotificationButton({
    super.key,
    required this.name,
    required this.isNotification
  });

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  bool isChanged = true;

  void _handleChange(bool value) {
    setState(() {
      isChanged = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              widget.name,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Switch(
                  focusColor: Colors.white,
                  activeColor: Colors.green,
                  value: isChanged,
                  onChanged: widget.isNotification ? _handleChange : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
