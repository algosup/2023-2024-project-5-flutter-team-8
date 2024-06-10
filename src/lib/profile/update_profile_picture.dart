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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/iconProfile/cat.svg',
                ),
                SvgPicture.asset(
                  'assets/iconProfile/frog.svg',
                ),
                SvgPicture.asset(
                  'assets/iconProfile/owl.svg',
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/iconProfile/monkey.svg',
                ),
                SvgPicture.asset(
                  'assets/iconProfile/fox.svg',
                ),
                SvgPicture.asset(
                  'assets/iconProfile/lion.svg',
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/iconProfile/wolf.svg',
                ),
                SvgPicture.asset(
                  'assets/iconProfile/dog.svg',
                ),
                SvgPicture.asset(
                  'assets/iconProfile/tiger.svg',
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/iconProfile/deer.svg',
                ),
                SvgPicture.asset(
                  'assets/iconProfile/bear.svg',
                ),
                SvgPicture.asset(
                  'assets/iconProfile/panda.svg',
                )
              ],
            ),
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
}
