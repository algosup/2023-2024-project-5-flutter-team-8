import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';

Widget certificationCategorie(BuildContext context, String path, String logoPath, String name, int value){
  return Expanded(
    child: GestureDetector(
      onTap: () => GoRouter.of(context).push(path),
      child: Container(
        height: 206.1,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: purpleColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: backgroundColor,
              ),
              child: SvgPicture.asset(
                logoPath,
                fit: BoxFit.contain,
              ),
            ),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('$value Certifications'),
          ],
        ),
      ),
    ),
  );
}