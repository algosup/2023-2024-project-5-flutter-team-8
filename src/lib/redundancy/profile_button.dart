import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';

Widget profileButton(
    BuildContext context, String name, String logo, String path) {
  final size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: () => GoRouter.of(context).push(path),
    child: Container(
      width: size.width,
      height: size.height / 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            width: 60,
            height: 60,
            child: SvgPicture.asset(
              logo,
              color: purpleColor,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: size.width / 4 * 3 - 24,
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}