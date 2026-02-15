import 'dart:async';
import 'package:flutter/material.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Quick-Fix Navigation'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 2000),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: value,
                child: child,
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Use this to see the invisible edges of your logo file
              // Wrap the Image in Padding to counteract the uneven empty space in the file
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,    // Pushes the ring down
                  left: 25.0,  // Pushes the ring to the left (by adding space on the right)
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 2.0), // Offsets the letterSpacing at the end
                child: const Text(
                  "QUICK-FIX",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}