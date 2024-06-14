import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: size.width * 0.45,
                  child: Image.asset('assets/img/official_logo.png'),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width * 0.85,
                  child: SvgPicture.asset(
                    'assets/img/splash_screen.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.08, // Adjust padding to provide space for the button
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your Dream Job\'s',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.bold,
                              height: 0.9,
                            ),
                          ),
                          const Text(
                            'Perfect',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: purpleColor,
                              decorationColor: purpleColor,
                              height: 0.9,
                            ),
                          ),
                          const Text(
                            'Matchmaker',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: purpleColor,
                              decorationColor: purpleColor,
                              height: 0.9,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Unleash Your True Potential!',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'DM Sans',
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                'Soft Skills Rule the Hiring Game!',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'DM Sans',
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        height: size.height * 0.08,
                        width: size.height * 0.08,
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/login');
                          },
                          child: Container(
                            // #TODO: Add a clean shadow and an animation when the button is clicked
                            height: size.height * 0.08,
                            width: size.height * 0.08,
                            decoration: const BoxDecoration(
                              color: purpleColor,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}