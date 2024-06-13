import 'package:adopte_1_candidat/redundancy/certificate.dart';
import 'package:flutter/material.dart';

class CertificationProfilePage extends StatefulWidget {
  const CertificationProfilePage({super.key});

  @override
  State<CertificationProfilePage> createState() => _CertificationProfilePageState();
}

class _CertificationProfilePageState extends State<CertificationProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 30,
            ),
            const Row(
              children: [
                SizedBox(
                  child: Text(
                    'My Certifications',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width,
              height: size.height / 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    certificate(context, 'Communication Proficiency Assessment', 'assets/icons/company_icon.svg'),
                    empty(context),
                    certificate(context, 'Verbal Communication Evaluation', 'assets/icons/company_icon3.svg'),
                    empty(context),
                    certificate(context, 'Interpersonal Skills Test', 'assets/icons/company_icon2.svg'),
                    empty(context),
                    certificate(context, 'Effective Communication Benchmark', 'assets/icons/company_icon.svg'),
                    empty(context),
                    certificate(context, 'Professional Communication Competency Test', 'assets/icons/company_icon2.svg'),
                    empty(context),
                    certificate(context, 'Advanced Communication Skills Assessment', 'assets/icons/company_icon.svg'),
                    empty(context),
                    certificate(context, 'Executive Communication Evaluation', 'assets/icons/company_icon.svg'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget empty(BuildContext context){
  final size = MediaQuery.of(context).size;

  return SizedBox(
    height: size.height / 35,
  );
}