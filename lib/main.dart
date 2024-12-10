import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:tubes_pbp_gym/view/home.dart';
import 'package:tubes_pbp_gym/view/register.dart';
import 'package:tubes_pbp_gym/view/login.dart';
import 'package:tubes_pbp_gym/view/riwayat.dart';
import 'package:tubes_pbp_gym/nfc/read_write.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
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
          case '/home':
            return MaterialPageRoute(builder: (context) => const HomeView());
          case '/nfc':
            return MaterialPageRoute(
                builder: (context) => const ReadWriteNFCScreen());
          default:
            return MaterialPageRoute(builder: (context) => const Riwayat());
        }
      },
      initialRoute: '/login',
    );
  }
}
