import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';
import 'package:flutter/material.dart';

import '../redundancy/certificate.dart';

class EfficiencyPage extends StatelessWidget {
  const EfficiencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController controllerEfficiency = TextEditingController();

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
                  controller: controllerEfficiency,
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
                    'Efficiency', 
                    style: 
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ],
            ),
            certificate(context, 'Lean Six Sigma Green Belt', 'assets/icons/company_icon.svg'),
            certificate(context, 'Lean Six Sigma Black Belt', 'assets/icons/company_icon3.svg'),
            certificate(context, 'Certified Efficiency Expert (CEE)', 'assets/icons/company_icon2.svg'),
            certificate(context, 'Certified Energy Manager (CEM)', 'assets/icons/company_icon.svg'),
            certificate(context, 'Certified Quality Engineer (CQE)', 'assets/icons/company_icon2.svg'),
            certificate(context, 'ISO 9001 Lead Auditor', 'assets/icons/company_icon.svg'),          
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}