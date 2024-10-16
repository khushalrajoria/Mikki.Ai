import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'data_entry_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color.fromARGB(255, 28, 28, 28),
      splash: 'assets/images/logo.png',
      nextScreen: DiaryEntryScreen(),
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 274,
    );
  }
  }
