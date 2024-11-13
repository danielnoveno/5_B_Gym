import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:tubes_pbp_gym/view/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Ensures the splash is centered
          children: [
            Center(
              child: LottieBuilder.asset("lottie/Splashscreen.json"),
            ),
          ],
        ),
      ),
      nextScreen: LoginView(),
      splashIconSize: 400,
      backgroundColor: Colors.blue,
    );
  }
}
