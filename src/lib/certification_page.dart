import 'dart:ffi';

import 'package:adopte_1_candidat/redundancy/text_fields.dart';

import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';



class CertificationPage extends StatelessWidget {
  const CertificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController _controller;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: 48,
            ),
            const CustomTextField(
              controller: _controller, 
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),              
            ),
            SizedBox(
              width: size.width,
              height: 96,
            ),
            const Row(
              children: [
                SizedBox(
                  child: Text(
                    'Certifications', 
                    style: 
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                ],
              ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: purpleColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: backgroundColor,
                            ),
                            child: SvgPicture.asset(
                              ''
                            ),
                          ),
                          const Text('Leadership', style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('30 Certifications'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: purpleColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: backgroundColor,
                            ),
                            child: SvgPicture.asset(
                              ''
                            ),
                          ),
                          const Text('Efficiency', style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('30 Certifications'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: purpleColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: backgroundColor,
                            ),
                            child: SvgPicture.asset(
                              ''
                            ),
                          ),
                          const Text('Social', style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('30 Certifications'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: purpleColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: backgroundColor,
                            ),
                            child: SvgPicture.asset(
                              ''
                            ),
                          ),
                          const Text('Agile', style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('30 Certifications'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
        ],
      ),
    );
  }
}