import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/notification_provider.dart';

Widget notificationButton(BuildContext context, String name, NotificationState state) {
  return NotificationButton(
    name: name,
    isNotification: state.individualNotifications[name]!,
    isGlobalNotification: state.isGlobalNotification,
  );
}

class NotificationButton extends ConsumerWidget {
  final String name;
  final bool isNotification;
  final bool isGlobalNotification;

  const NotificationButton({
    super.key,
    required this.name,
    required this.isNotification,
    required this.isGlobalNotification,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              name,
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
                  value: isNotification,
                  onChanged: isGlobalNotification ? (bool value) {
                    ref.read(notificationProvider.notifier).toggleIndividualNotification(name, value);
                  } : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
