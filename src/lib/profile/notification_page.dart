import 'package:adopte_1_candidat/redundancy/rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../redundancy/notification_button.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isNotification = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                              child: Icon(Icons.notifications_none),),),
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
                                value: isNotification,
                                onChanged: (bool value) {
                                  setState(() {
                                    isNotification = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  notificationButton(context, 'New Job Alert', isNotification),
                  notificationButton(context, 'Message from Company', isNotification),
                  notificationButton(context, 'New Matches', isNotification),
                  notificationButton(context, 'Application Rejection', isNotification),
                  notificationButton(context, 'New Certificate Available', isNotification),
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