import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../redundancy/rectangle_button.dart';

class UpdateProfilePicture extends StatelessWidget {
  const UpdateProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06), // Updated padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height / 20,
            ),
            _buildIconRow([
              'assets/iconProfile/cat.svg',
              'assets/iconProfile/frog.svg',
              'assets/iconProfile/owl.svg',
            ], size),
            _buildIconRow([
              'assets/iconProfile/monkey.svg',
              'assets/iconProfile/fox.svg',
              'assets/iconProfile/lion.svg',
            ], size),
            _buildIconRow([
              'assets/iconProfile/wolf.svg',
              'assets/iconProfile/dog.svg',
              'assets/iconProfile/tiger.svg',
            ], size),
            _buildIconRow([
              'assets/iconProfile/deer.svg',
              'assets/iconProfile/bear.svg',
              'assets/iconProfile/panda.svg',
            ], size),
            SizedBox(
              height: size.height / 15,
            ),
            BlackRectangleButton(
              size: size,
              text: 'UPDATE',
              onPressed: () {
                GoRouter.of(context).push('/profile');
              },
            ),
            SizedBox(
              height: size.height / 25,
            ),
          ],
        ),
      ),
    );
  }

  Row _buildIconRow(List<String> assetPaths, Size size) {
    double iconSize = size.width / 5; // Adjust the division factor as needed
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: assetPaths.map((path) => SizedBox(
        width: iconSize,
        height: iconSize,
        child: SvgPicture.asset(path),
      )).toList(),
    );
  }
}
