// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:math' as math;
import 'package:flutter/material.dart';

const int maxSeeds = 250;

void main() {
  runApp(const Loading());
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SunflowerState();
  }
}

class _SunflowerState extends State<Loading> {
  int seeds = 0;

  @override
  void initState() {
    super.initState();
    _incrementCounter();
  }

  _incrementCounter() async {
    if (seeds == 0) {
      for (var i = 0; i < maxSeeds; i++) {
        //Loop 100 times
        await Future.delayed(const Duration(milliseconds: 2), () {
          // Delay 500 milliseconds
          setState(() {
            seeds++; //Increment Counter
          });
        });
      }
      await Future.delayed(const Duration(milliseconds: 750), () {
        _decrementCounter();
      });
    }
  }

  _decrementCounter() async {
    if (seeds == maxSeeds) {
      for (var i = maxSeeds; i >= 1; i--) {
        //Loop 100 times
        await Future.delayed(const Duration(milliseconds: 1), () {
          // Delay 500 milliseconds
          setState(() {
            seeds--; //Increment Counter
          });
        });
      }
    }
    
    _incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.6, // Adjust this value to scale the image and text
                child: Column(
                  children: [
                    Image.asset('assets/img/logo.png'),
                    // const Text("Adopte 1 Candidat", 
                    //   style: TextStyle(fontFamily:'Didot', color: Colors.white, fontSize: 50)),
                  ],
                ),
              ),
              SizedBox(height: size.height / 10),
              SunflowerWidget(seeds),
            ],
          ),
        ),
      ),
    );
  }
}

class SunflowerWidget extends StatelessWidget {
  static const tau = math.pi * 2;
  static const scaleFactor = 1 / 15;
  static const size = 75.0;
  static final phi = (math.sqrt(5) + 1) / 2;
  static final rng = math.Random();

  final int seeds;

  const SunflowerWidget(this.seeds, {super.key});

  @override
  Widget build(BuildContext context) {
    final seedWidgets = <Widget>[];

    for (var i = 0; i < seeds; i++) {
      final theta = i * tau / phi;
      final r = math.sqrt(i) * scaleFactor;

      seedWidgets.add(AnimatedAlign(
        key: ValueKey(i),
        duration: Duration(milliseconds: rng.nextInt(500) + 250),
        curve: Curves.easeInOut,
        alignment: Alignment(r * math.cos(theta), -1 * r * math.sin(theta)),
        child: const Dot(true),
      ));
    }

    // draw the seeds only from the moment they start moving to the end

    for (var j = seeds; j < maxSeeds; j++) {
      final x = math.cos(tau * j / (maxSeeds - 1)) * 1.5;
      final y = math.sin(tau * j / (maxSeeds - 1)) * 1.5;
      seedWidgets.add(AnimatedAlign(
        key: ValueKey(j),
        duration: Duration(milliseconds: rng.nextInt(500) + 250),
        curve: Curves.easeInOut,
        alignment: Alignment(x, y),
        child: const Dot(false),
      ));
    }

    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(children: seedWidgets),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  static const size = 4.0;
  static const radius = 3.0;

  final bool lit;

  const Dot(this.lit, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: lit ? const Color.fromRGBO(214, 205, 254, 1) : const Color.fromRGBO(0, 0, 0, 0),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: const SizedBox(
        height: size,
        width: size,
      ),
    );
  }
}
