import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const int maxSeeds = 250;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SunflowerState();
  }
}

class _SunflowerState extends State<Loading> {
  int seeds = 0;
  int cycles = 0;
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    _incrementCounter();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  void _incrementCounter() async {
    for (var i = 0; i < maxSeeds; i++) {
      await Future.delayed(const Duration(milliseconds: 2), () {
        if (_isMounted) {
          setState(() {
            seeds++;
          });
        }
      });
    }
    await Future.delayed(const Duration(milliseconds: 750), _decrementCounter);
  }

  void _decrementCounter() async {
    for (var i = maxSeeds; i >= 1; i--) {
      await Future.delayed(const Duration(milliseconds: 1), () {
        if (_isMounted) {
          setState(() {
            seeds--;
          });
        }
      });
    }
    cycles++;
    if (cycles == 1) {
      _redirect();
    } else {
      _incrementCounter();
    }
  }

  void _redirect() {
    if (_isMounted) {
      GoRouter.of(context).go('/splashScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 0.6,
              child: Image.asset('assets/img/unofficial_logo.png'),
            ),
            SizedBox(height: size.height / 10),
            SunflowerWidget(seeds),
          ],
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
