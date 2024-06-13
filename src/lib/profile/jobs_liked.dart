import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobsLikedPage extends StatefulWidget {
  const JobsLikedPage({super.key});

  @override
  State<JobsLikedPage> createState() => _JobsLikedPageState();
}

class _JobsLikedPageState extends State<JobsLikedPage> {
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
                    'Jobs Liked',
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
                    jobsLiked(context, 'Waiter',
                        'assets/icons/company_icon.svg', 'Jul', 30, 2024),
                    empty(context),
                    jobsLiked(context, 'Software Engineer',
                        'assets/icons/company_icon3.svg', 'Jul', 10, 2024),
                    empty(context),
                    jobsLiked(context, 'Marketing Manager',
                        'assets/icons/company_icon2.svg', 'Ju', 30, 2024),
                    empty(context),
                    jobsLiked(context, 'Data Analyst',
                        'assets/icons/company_icon.svg', 'May', 30, 2024),
                    empty(context),
                    jobsLiked(
                        context,
                        'Financial Analyst',
                        'assets/icons/company_icon2.svg', 'Apr', 30, 2024),
                    empty(context),
                    jobsLiked(
                        context,
                        'Project Manager',
                        'assets/icons/company_icon.svg', 'Mar', 30, 2024),
                    empty(context),
                    jobsLiked(context, 'Sales Executive',
                        'assets/icons/company_icon.svg', 'Feb', 28, 2024),
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

Widget empty(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return SizedBox(
    height: size.height / 35,
  );
}

Widget jobsLiked(BuildContext context, String name, String path, String month,
    int day, int year) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 80,
              height: 80,
              child: SvgPicture.asset(
                path,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              child: Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            '$month $day, $year',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color.fromRGBO(213, 213, 213, 1)),
          ),
        ),
      ],
    ),
  );
}
