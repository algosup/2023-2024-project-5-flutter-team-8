import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../redundancy/notification_button.dart';
import '../provider/notification_provider.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final notificationState = ref.watch(notificationProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 20,
            ),
            const Row(
              children: [
                SizedBox(
                  child: Text(
                    'Notifications',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width,
              height: size.height / 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.notifications_none),
                          ),
                        ),
                        const SizedBox(
                          child: Text(
                            'Notifications',
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
                                value: notificationState.isGlobalNotification,
                                onChanged: (bool value) {
                                  ref.read(notificationProvider.notifier).toggleGlobalNotification(value);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  notificationButton(context, 'New Job Alert', notificationState),
                  notificationButton(context, 'Message from Company', notificationState),
                  notificationButton(context, 'New Matches', notificationState),
                  notificationButton(context, 'Application Rejection', notificationState),
                  notificationButton(context, 'New Certificate Available', notificationState),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 12,
            ),
            SizedBox(
              child: BlackRectangleButton(
                size: size,
                text: 'SAVE',
                onPressed: () {
                  GoRouter.of(context).push('/profile');
                },
              ),
            ),
            SizedBox(
              height: size.height / 12,
            ),
          ],
        ),
      ),
    );
  }
}
