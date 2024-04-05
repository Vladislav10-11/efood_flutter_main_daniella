import 'package:efood_flutter/api/auth_api.dart';
import 'package:efood_flutter/api/auth_provider.dart';
import 'package:efood_flutter/pages/additives_page.dart';
import 'package:efood_flutter/pages/home_page.dart';
import 'package:efood_flutter/pages/login_page.dart';
import 'package:efood_flutter/pages/profile_page.dart';
import 'package:efood_flutter/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
