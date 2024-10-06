import 'package:flutter/material.dart';
import 'package:guidedlayout2_1664/View/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      home: LoginView("helo world"),
=======
    return const MaterialApp(
      home: LoginView("Hello World"),
>>>>>>> Stashed changes
    );
  }
}

