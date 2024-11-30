// main.dart
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tubes_pbp_gym/providers/cart_provider.dart';
// import 'package:tubes_pbp_gym/view/datadiri/beratbadan.dart';
// import 'package:tubes_pbp_gym/view/datadiri/jeniskelamin.dart';
// import 'package:tubes_pbp_gym/view/datadiri/tinggibadan.dart';
// import 'package:tubes_pbp_gym/view/datadiri/tujuan.dart';
// import 'package:tubes_pbp_gym/view/home.dart';
// import 'package:tubes_pbp_gym/view/login.dart';
import 'package:tubes_pbp_gym/view/register.dart';
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
      home: RegisterView(),
    );
  }
}
