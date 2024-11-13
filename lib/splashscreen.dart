import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:tubes_pbp_gym/view/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          // Use Expanded or Flexible to make the animation fit the screen
          Expanded(
            child: LottieBuilder.asset(
              "lottie/Flow-2.json", repeat: false, // Play only once
              reverse: false,
            ),
          ),
        ],
      ),
      nextScreen: LoginView(),
      splashIconSize: 900, // Adjust splash icon size
      backgroundColor: Colors.black,
      duration:
          1800, // Adjust this value to make sure the animation has enough time to play
    );
  }
}
