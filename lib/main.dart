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
      routes: {
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
      },
      initialRoute: '/login',
    );
  }
}
