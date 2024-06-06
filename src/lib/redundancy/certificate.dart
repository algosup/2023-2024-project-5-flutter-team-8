import 'package:adopte_1_candidat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget certificate(BuildContext context, String name, String path){
  final size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height / 10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: backgroundColor,
    ),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          width: 80,
          height: 80,
          child: SvgPicture.asset(
            path,
            fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: size.width / 4 * 3 - 24,
            child: Center(
              child: Text(
                name, 
                style: const TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    ),
  );
}