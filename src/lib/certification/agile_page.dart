import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../redundancy/certificate.dart';

class AgilePage extends StatelessWidget {
  const AgilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController controllerAgile = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
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
                      controller: controllerAgile,
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
              ),
              SizedBox(
                width: size.width,
                height: 56,
              ),
              const Row(
                children: [
                  SizedBox(
                    child: Text(
                      'Agile', 
                      style: 
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.height * 0.6,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
              certificate(context, 'Certified ScrumMaster (CSM)', 'assets/icons/company_icon.svg'),
              certificate(context, 'Professional Scrum Master (PSM)', 'assets/icons/company_icon3.svg'),
              certificate(context, 'SAFe Agilist (SA)', 'assets/icons/company_icon2.svg'),
              certificate(context, 'Certified Agile Project Manager (IAPM)', 'assets/icons/company_icon.svg'),
              certificate(context, 'Disciplined Agile Scrum Master (DASM)', 'assets/icons/company_icon2.svg'),
              certificate(context, 'ICAgile Certified Professional (ICP)', 'assets/icons/company_icon.svg'),  
                  ],  
                )
              )     
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}