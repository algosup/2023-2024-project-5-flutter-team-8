import 'package:adopte_1_candidat/loading.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArrowButton(),
    );
  }
}

class ArrowButton extends StatefulWidget {
  const ArrowButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() => _count++);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
          child: const Icon(Icons.arrow_right, color: Colors.black),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20), // Adjust the padding as needed
            backgroundColor: const Color.fromRGBO(214, 205, 254, 1), // Button background color
          ),
        ),
      ),
    );
  }
}
