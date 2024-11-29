// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:tubes_pbp_gym/view/datadiri/beratbadan.dart';
import 'package:tubes_pbp_gym/view/datadiri/jeniskelamin.dart';
import 'package:tubes_pbp_gym/view/datadiri/tinggibadan.dart';
import 'package:tubes_pbp_gym/view/datadiri/tujuan.dart';
import 'package:tubes_pbp_gym/view/home.dart';
import 'package:tubes_pbp_gym/view/register.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterView(),
    );
  }
}
