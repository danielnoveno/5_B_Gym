import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/register.dart';
import 'package:tubes_pbp_gym/view/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => const LoginView());
          case '/register':
            return MaterialPageRoute(
                builder: (context) => const RegisterView());
          default:
            return MaterialPageRoute(builder: (context) => const LoginView());
        }
      },
      initialRoute: '/login',
    );
  }
}
