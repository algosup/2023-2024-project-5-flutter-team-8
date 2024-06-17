import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';

import '../redundancy/certification_categorie.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class CertificationPage extends StatelessWidget {
  const CertificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: size.width - 80,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: backgroundColor,
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action for the settings icon
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.display_settings),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width,
                height: 80,
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
              Row(
                children: [
                  certificationCategorie(context, '/leadershipPage', 'assets/icons/leadership_logo.svg', 'Leadership', 30),
                  certificationCategorie(context, '/efficiencyPage', 'assets/icons/efficiency_logo.svg', 'Efficiency', 30),
                ],
              ),
              Row(
                children: [
                  certificationCategorie(context, '/socialPage', 'assets/icons/social_logo.svg', 'Social', 30),
                  certificationCategorie(context, '/agilePage', 'assets/icons/agile_logo.svg', 'Agile', 30),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}
