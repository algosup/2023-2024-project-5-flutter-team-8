import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';
import 'package:flutter/material.dart';

import '../redundancy/certificate.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController controllerSocial = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: size.width - 80,
                child: TextField(
                  controller: controllerSocial,
                  decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),    
                ),
              )
            ),
            SizedBox(
              width: size.width,
              height: 56,
            ),
            const Row(
              children: [
                SizedBox(
                  child: Text(
                    'Social', 
                    style: 
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ],
            ),
            certificate(context, 'Communication Proficiency Assessment', 'assets/icons/company_icon.svg'),
            certificate(context, 'Verbal Communication Evaluation', 'assets/icons/company_icon3.svg'),
            certificate(context, 'Interpersonal Skills Test', 'assets/icons/company_icon2.svg'),
            certificate(context, 'Effective Communication Benchmark', 'assets/icons/company_icon.svg'),
            certificate(context, 'Professional Communication Test', 'assets/icons/company_icon2.svg'),
            certificate(context, 'Advanced Communication Skills', 'assets/icons/company_icon.svg'),          
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}