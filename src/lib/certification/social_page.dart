import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../redundancy/certificate.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController controllerSocial = TextEditingController();

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
                    controller: controllerSocial,
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
              Container(
                height: size.height * 0.6,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
              certificate(context, 'Communication Proficiency Assessment', 'assets/icons/company_icon.svg'),
              certificate(context, 'Verbal Communication Evaluation', 'assets/icons/company_icon3.svg'),
              certificate(context, 'Interpersonal Skills Test', 'assets/icons/company_icon2.svg'),
              certificate(context, 'Effective Communication Benchmark', 'assets/icons/company_icon.svg'),
              certificate(context, 'Professional Communication Test', 'assets/icons/company_icon2.svg'),
              certificate(context, 'Advanced Communication Skills', 'assets/icons/company_icon.svg'),          
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